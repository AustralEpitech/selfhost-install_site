# install_site
Container to generate config files and certificates for the main web server.<br>
This image was made to complement [selfhost-nginx](https://github.com/AustralEpitech/selfhost-nginx),
but any web server should be compatible.

## How-To
You need three volumes (check [example](/example)):
| Path                    | Description                                               |
| ----------------------- | --------------------------------------------------------- |
| /web/*your_config_file* | Website config template. Every variable will be replaced. |
| /sites-availables       | Config folder of your web server.                         |
| /etc/letsencrypt        | The SSL certificates                                      |

Once this container has exited, you need to restart your web server.

### Variables
- DOMAIN
- EMAIL
- SSL_DOMAIN (optional, useful for wildcard certificates)
- Every variables you put in *your_config_file*

## Example:
You can find actual applications in my others repos: [selfhost](https://github.com/users/AustralEpitech/projects/2).
