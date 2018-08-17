#!/bin/bash
# set -e

gg_installer(){

  ################################################
  # Preparings
  #################################################

  # Some important variables
  SCRIPTS_FOLDER=~/.gg_tools
  INSTALL_SCRIPT="for f in ${SCRIPTS_FOLDER}/*; do source "'$f'"; done"
  SCRIPT_NAME=$1

  # Colors
L_RED='\033[1;31m'
L_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
D_GREY='\033[1;30m'
D_VIOL='\033[1;34m'
NC='\033[0m'

# Check if previous command return succes result
check_command_exec_status () {
  if [ $1 -eq 0 ];then
    echo -e "${YELLOW}Success!${NC}"
    echo
  else
    echo -e "${L_RED}ERROR${NC}"
    echo
  fi
}

# This is for GG aliases
if [ $SCRIPT_NAME -eq 'gg_aliases' ];then
  # Let's check installed Git version
  GIT_VERSION=`git --version | grep -o -E '[0-9]+' | head -1`
  case $GIT_VERSION in
    1)
    SCRIPT_NAME='gg_aliases_1X'
    echo 'You have Git 1.X. That is fine but I would suggest you to upgrade it'
    ;;
    2)
    echo 'You have Git 2.X. Nice!'
    ;;
    *)
    echo 'Can not detect Git version. Exiting'
    return
    ;;
  esac
fi


################################################
# What script do we want to install?
#################################################

case $SCRIPT_NAME in
  'bdsm')
    SCRIPT_URL='https://raw.githubusercontent.com/michaelradionov/bdsm/master/bdsm.sh'
  ;;
  'gg_aliases')
  SCRIPT_URL='https://raw.githubusercontent.com/michaelradionov/git-alias/master/aliases_git2.sh'
  ;;
  'gg_aliases_1X')
  SCRIPT_URL='https://raw.githubusercontent.com/michaelradionov/git-alias/master/aliases_git1.sh'
  ;;
  'hello_bash')
  SCRIPT_URL='https://raw.githubusercontent.com/michaelradionov/helloBash/master/helloBash.sh'
  ;;
  *)
    echo -e "${L_RED}Can't find script with name ${SCRIPT_NAME}${NC}"
    return
  ;;
esac

################################################
# Install script!
#################################################

echo
echo "Installing ${SCRIPT_NAME} script..."
echo

# creating scripts directory if doesn't exists
if [ ! -d  $SCRIPTS_FOLDER ]; then
  echo -e "Making ${WHITE}${SCRIPTS_FOLDER}${NC} directory for any Go Git Script"
  mkdir $SCRIPTS_FOLDER
  check_command_exec_status $?
  else
  echo -e "Found ${WHITE}${SCRIPTS_FOLDER}${NC} folder. Continuing ..."
fi

echo -e "Copying script in ${WHITE}${SCRIPT_NAME}.sh${NC}"
curl -s ${SCRIPT_URL} > ${SCRIPTS_FOLDER}/${SCRIPT_NAME}.sh
check_command_exec_status $?

echo -e "Check for line ${WHITE}\"$INSTALL_SCRIPT\"${NC} in your ${WHITE}~/.bashrc${NC} file"
if grep -qF "${INSTALL_SCRIPT}" ~/.bashrc
then
  echo -e "Ok, it is installed already"
else

    echo -e "Making backup of your ${WHITE}~/.bashrc${NC} in ${WHITE}~/.bashrc.backup_$(date +%Y-%m-%d)${NC}"
    cp ~/.bashrc ~/.bashrc.backup_$(date +%Y-%m-%d)
    check_command_exec_status $?

  echo -e "Adding sourcing line at the end of your ${WHITE}.bashrc${NC}"
  echo '' >> ~/.bashrc
  echo "### GO GIT TOOLS START" >> ~/.bashrc
  echo "${INSTALL_SCRIPT}" >> ~/.bashrc
  echo "### GO GIT TOOLS START" >> ~/.bashrc
  echo '' >> ~/.bashrc
  check_command_exec_status $?
fi

echo ''
echo -e "Sourcing ${WHITE}${SCRIPTS_FOLDER}/${SCRIPT_NAME}.sh${NC}"
source "${SCRIPTS_FOLDER}/${SCRIPT_NAME}.sh"
check_command_exec_status $?

}
