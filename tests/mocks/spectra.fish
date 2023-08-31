# Refer to Spectra order of insect, see https://en.wikipedia.org/wiki/Phasmatodea

# Set up the path to located the mocked functions
set --universal SPECTRA_MOCKS_DIRECTORY (status dirname)/functions/

source (status dirname)/mocking.fish
source (status dirname)/spying.fish
source (status dirname)/cleaning.fish
