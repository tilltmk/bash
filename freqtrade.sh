mkdir ft_userdata
cd ft_userdata/
# Download the docker-compose file from the repository
curl https://raw.githubusercontent.com/freqtrade/freqtrade/stable/docker-compose.yml -o docker-compose.yml

# Pull the freqtrade image
docker compose pull

# Create user directory structure
docker compose run --rm freqtrade create-userdir --userdir user_data

# Create configuration - Requires answering interactive questions
docker compose run --rm freqtrade new-config --config user_data/config.json
