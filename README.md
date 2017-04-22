# SmartVISU
For documentation and information on the SmartVISU project [check their GitHub page](https://github.com/Martin-Gleiss/smartvisu).

## Exposed ports
* 80/tcp (http)
* 443/tcp	(https)

## Exported volumes
* /var/www/html (SmartVISU installation)

## Example container start command
This example starts a version 2.8 container on the default network on port 80 and maps the www folder to ./files/smartvisu. The hostname of the container will be smartvisu.docker. If the supplied www folder is empty the container pull's the files from GitHub. So working internet connection is essential.

    docker run -d \
    	--publish 80:80 \
    	--volume $PWD/files/smartvisu:/var/www/html \
    	--hostname=smartvisu.docker \
    	--name=shng-smartvisu \
    	foxi352/smartvisu:2.8
