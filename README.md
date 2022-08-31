# install_site
Container to generate config files and certificates for the main web server.
In the examples, Nginx will be used, but any web server should be compatible.

## How-To
You need three volumes:
- /web_config: this is where you put the config file for your website.
  You can put environment variables in them, they will be replaced as they are
  copied.
- /sites-availables: output config for your web server
- /etc/letsencrypt: the SSL certificates

Once this container has exited, you need to restart your web server.

### Variables
- DOMAINS (space separated domain names)
- Every variables you put in your config files.

## Example:
You can see an example in docker-compose.yaml or in my others repos in this
project: [selfhost](https://github.com/users/AustralEpitech/projects/2)
