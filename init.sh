#!/bin/sh

# Make sure we're in the correct directory.
# Just to be safe, we'll remove any trailing slashes.
THISDIR=$(pwd | sed -e 's/\/*$//g')
if [ "${THISDIR}" != "${HOME}/.dotfiles" ]; then
  echo "ERROR: Wrong directory."
  echo "  This script must be run from '${HOME}/.dotfiles'"
  echo "  Make sure the dotfiles folder has been moved to this location."
  echo ""
  echo "Exiting..."
  exit 1
fi

# Get the timestamp for the backups.
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
BACKUPDIR=${HOME}/dotfiles-backup-${TIMESTAMP}

# Let the user know where the backups are going.
echo "Creating directory '${BACKUPDIR}' to store old dotfiles..."
echo ""
if [ -e "${BACKUPDIR}" ]; then 
  echo "ERROR: Directory '${BACKUPDIR}' already exists."
  echo ""
  echo "Exiting..."
else
  mkdir "${BACKUPDIR}"
  echo "Directory created!"
  echo ""
fi

# Get list of files to back up.
echo "Creating list of files to back up..."
echo ""
FILES=$(ls -1 | sed -e '/^init\.sh$/ d' -e '/^\./ d')

# Back up the files.
echo "Backing up old dotfiles..."
echo ""
for FILE in ${FILES}; do
  # Does the file exist?
  if [ -e "${HOME}/.${FILE}" ]; then
    echo "Found '${HOME}/.${FILE}'"
    echo "Backing up to '${BACKUPDIR}'"
    cp -L "${HOME}/.${FILE}" "${BACKUPDIR}/${FILE}"
    echo "File saved!"
    echo ""
  fi
done
echo "Backup complete!"
echo ""

# Create symbolic links to files in this folder.
echo "Creating symbolic links to new dotfiles..."
echo ""
for FILE in ${FILES}; do
  # We need to check if the file is a local file or not.
  ISLOCAL=$(echo "${FILE}" | sed -e '/\.local$/ !d')

  if [ "${ISLOCAL}" = "" ]; then
    # File is not local, so replace old file with a symbolic link
    # to the new one.
    echo "Creating symbolic link to '${THISDIR}/${FILE}' at '${HOME}/.${FILE}'"
    ln -sTf "${THISDIR}/${FILE}" "${HOME}/.${FILE}"
    echo "Created link!"
  else
    # File is local, so make sure we don't overwrite the existing one.
    if [ -e "${HOME}/.${FILE}" ]; then
      # File already exists, so leave it alone.
      echo "Local file '${HOME}/.${FILE}' already exists."
      echo "Leaving it alone."
    else
      # File does not exist yet, so copy it to the new location instead
      # of linking it.
      echo "Local file '${HOME}/.${FILE}' does not exist."
      echo "Copying new file from '${THISDIR}/${FILE}' to '${HOME}/.${FILE}'"
      cp -rf "${THISDIR}/${FILE}" "${HOME}/.${FILE}"
      echo "Copied file!"
    fi
  fi
  echo ""
done

# Set up .vim directory.
echo "Setting up directory '${HOME}/.vim'"
mkdir -p "${HOME}/.vim/autoload" "${HOME}/.vim/bundle"
if [ ! -e "${HOME}/.vim/autoload/pathogen.vim" ]; then
  # Get Pathogen if we don't have it.
  curl -LSso "${HOME}/.vim/autoload/pathogen.vim" "https://tpo.pe/pathogen.vim"
fi
if [ ! -e "${HOME}/.vim/bundle/arm-syntax-vim" ]; then
  # Get arm-syntax-vim if we don't have it.
  git clone --recursive "https://github.com/ARM9/arm-syntax-vim.git" "${HOME}/.vim/bundle/arm-syntax-vim"
fi
if [ ! -e "${HOME}/.vim/bundle/vim-go" ]; then
  # Get vim-go if we don't have it.
  git clone --recursive "https://github.com/fatih/vim-go.git" "${HOME}/.vim/bundle/vim-go"
fi
if [ ! -e "${HOME}/.vim/bundle/vim-jsx" ]; then
  # Get vim-jsx if we don't have it.
  git clone --recursive "https://github.com/mxw/vim-jsx.git" "${HOME}/.vim/bundle/vim-jsx"
fi

# All done.
echo ""
echo "Finished!"
