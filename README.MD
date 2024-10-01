
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/CypherPunk2071/shitserve/master/shitserve.png" alt="Shitserve" width="200"></a>
  <br>
  Shitserve
  <br>
</h1>

<h4 align="center">A shitty webserver built with x64 assembly on top of gas<a href="https://en.wikipedia.org/wiki/GNU_Assembler" target="_blank">GNU Assembler</a>.</h4>

 <a href="https://saythanks.io/to/vakvak@duck.com">
      <img src="https://img.shields.io/badge/SayThanks.io-%E2%98%BC-1EAEDB.svg">
  </a>
  <a href="https://idonttakedontations">
    <img src="https://img.shields.io/badge/$-donate-ff69b4.svg?maxAge=2592000&amp;style=flat">
  </a>
</p>

<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#download">Download</a> •
  <a href="#credits">Credits</a> •
  <a href="#related">Related</a> •
  <a href="#license">License</a>
</p>

![screenshot](https://raw.githubusercontent.com/amitmerchant1990/electron-markdownify/master/shitserve.gif)

## Key Features

* Dynamically respond to GET and POST requests
* Shitserve gives birth to children
  - Shitserve automatically forks at every request. 
* Shitserve can reply concurrent requests  
* Shitserve writes to /tmp directory and reads from /tmp directory
* Currently shitserve can only read and write specific length files.
* Shitserve is a solution to something but I can't tell.
* Linux ready

## How To Use

To clone and run this application, you'll need Git and binutils (which comes with build-essential) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://github.com/CypherPunk2071/shitserve

# Go into the repository
$ cd shitserve

# Install dependencies
$ sudo apt install build-essential

# Compile and link the assembly code.
$ as -o shitserve.o shitserve.s && ld -o shitserve shitserve.o

# Run the binary
$ chmod +x shitserve && sudo ./shitserve
```

> After installing nc you can simply test the server with

```bash
$ echo -en "POST /tmp/tmpuxo56cqu HTTP/1.1\r\nHost: localhost\r\nUser-Agent: python-requests/2.32.3\r\nAccept-Encoding: gzip, deflate, zstd\r\nAccept: */*\r\nConnection: keep-alive\r\nContent-Length: 255\r\n\r\nmG2ajzAxP1ccCWv1pKyURGHBeQozqPYmgn69vaB7yaZjSj9k2lXlMHePIuvD4aYqRQMvwj4wsXBUVHAyNI5ojWCkaUwT6c3LbpQQaokhtVzk7mQNLOSRLZgecy7xb0s7bElt9Aw0QXfdPie7hHgNhTk0kUnTPIaMJ6BPIALL5xQNI6N6A2jiIiQBzObhmB3cIW40QiQOoHt8lt46Kc5BRM01APsYhe8kDo7KNHyyaPVqVUHQAa6UsimqyqxrkuR" | sudo nc -nv 127.0.0.1 80
```

> **Note**
> This will create a file named /tmp/tmpuxo56cqu under your /tmp directory 

> To get the contents of file you should run

```bash
$ echo -en "GET /tmp/tmpuxo56cqu HTTP/1.1\r\nHost: localhost\r\nUser-Agent: python-requests/2.32.3\r\nAccept-Encoding: gzip, deflate, zstd\r\nAccept: */*\r\nConnection: keep-alive\r\n\r\n" | sudo nc -nv 127.0.0.1 80
```

> There is also some thing called testserver.py you can take a look at that.

## Credits

This software uses the following open source packages:

- [binutils](https://www.gnu.org/software/binutils/)
- [vim](https://www.vim.org/)
- Smiling shit made with stable diffusion
- gif ffmpeg

## Related

[markdownify-web](https://github.com/amitmerchant1990/markdownify-web) - Web version of Markdownify

## Support

<a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/purple_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

<p>Or</p> 

<a href="https://www.youtube.com/watch?v=2yJgwwDcgV8">
	<img src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="160">
</a>

## You may also like...

- [official-dojos](https://github.com/pwncollege/official-dojos) - Some martial art thing
- [Correo](https://github.com/smallkirby/kernelpwn) - look at corjail

## License

none

---

> GitHub [@CypherPunk2071](https://github.com/CypherPunk2071) &nbsp;&middot;&nbsp;
> X [@melodeath6](https://x.com/melodeath6)


