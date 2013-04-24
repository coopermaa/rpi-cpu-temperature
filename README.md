# Raspberry Pi CPU Temperature Chart

This project creates a real-time temperature chart for Raspberry Pi's CPU.

## Installation 

You need to setup Node, NPM and CoffeeScript (You might want to adjust the version number of node.js below):

    $ wget http://nodejs.org/dist/v0.8.22/node-v0.8.22-linux-arm-pi.tar.gz
    $ cd /usr/local
    $ sudo tar xzvf ~/node-v0.8.22-linux-arm-pi.tar.gz --strip 1

Then clone this repository and prepare it for use with:

    $ sudo apt-get install git-core
    $ git clone https://github.com/coopermaa/rpi-cpu-temperature
    $ cd rpi-cpu-temperature
    $ npm install

## Usage
  
Start server:

    $ coffee app.coffee

Or:    

    $ nohup coffee app.coffee > /dev/null &
    
Then point your browser at http://&lt;IP of Raspberry Pi&gt;:3000

Here is a screenshhot:

![screencut](http://bit.ly/ZkguUB)
