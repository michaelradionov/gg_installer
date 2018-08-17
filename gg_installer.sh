#!/bin/bash
# set -e

gg_installer(){


  # Colors
L_RED='\033[1;31m'
L_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
D_GREY='\033[1;30m'
D_VIOL='\033[1;34m'
NC='\033[0m'

# What script do we want to install?
SCRIPT_NAME=$1
case $SCRIPT_NAME in
  'bdsm')
    SCRIPT_URL='https://raw.githubusercontent.com/michaelradionov/bdsm/master/bdsm.sh'
  ;;
  *)
    echo -e "${L_RED}Can't find script with name ${SCRIPT_NAME}${NC}"
    return
  ;;
esac

# Some important variables
SCRIPTS_FOLDER=~/.gg_tools
INSTALL_SCRIPT="for f in ${SCRIPTS_FOLDER}/*; do source "'$f'"; done"

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

echo "Installing ${SCRIPT_NAME} script..."

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
  echo "### ${SCRIPT_NAME} START" >> ~/.bashrc
  echo "${INSTALL_SCRIPT}" >> ~/.bashrc
  echo "### ${SCRIPT_NAME} END" >> ~/.bashrc
  echo '' >> ~/.bashrc
  check_command_exec_status $?
fi

echo ''
echo -e "Sourcing ${WHITE}${SCRIPTS_FOLDER}/${SCRIPT_NAME}.sh${NC}"
source "${SCRIPTS_FOLDER}/${SCRIPT_NAME}.sh"
check_command_exec_status $?

}
