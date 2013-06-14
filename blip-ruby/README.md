blip-ruby
=========

The Balloon Landing Inference Program

Written by Eric Lujan for Ruby 1.9.3-head.

Based on research by Amanda Maxham, James Crist, Ian Rabago, Eric Lujan, and Jake Lee conducted at the University of Nevada, Las Vegas.

Please send feedback, questions, comments, and love letters to lujane@unlv.nevada.edu.

**Note:** BLIP is a work-in-progress. Please don't rely on it for the end-all be-all source for high-altitude ballooning launch predictions. We made it as an academic exercise. Don't get mad if it's terribly off or inconvenient to use. Instead, tell us so we can improve it.

### Usage

#### Requirements
BLIP is pretty low-maintenence and will run on any OS that supports Ruby. It was designed specifically with *Ruby 1.9.3* in mind, but you can probably get away with running an older or newer version of Ruby if that tickles your fancy. You'll know it doesn't work in your version if it doesn't work. That being said, here's a few recommendations:

- Use RVM if on a Mac, Linux, or UNIX system (if you don't know what that is, it's a utility that lets you install and manage multiple versions of Ruby)
- To maximize your compatibility with BLIP (and most other Ruby programs), run `rvm install 1.9.3-head && rvm use 1.9.3 --default` from the command line. You'll make life easier on yourself (and Ruby developers too).
- If you're a Windows user, you can install Ruby via a downloadable .exe file from [here](http://rubyinstaller.org/downloads/). Make sure you grab the one for 1.9.3.
- If you encounter any bugs, please help us squash them. You can email me with bug reports, or if you're a Ruby developer, we're glad to get your advice on how to make BLIP better.

#### Running BLIP
In its current Ruby version, BLIP has no graphical user interface and must be run from the command line. Open up your terminal, change to the directory where you downloaded BLIP and type `ruby blip.rb` to start the interactive command line interpreter.

If you already know the subcommand you'd like to run, you can run `ruby blip.rb <command>` to execute that command directly and then exit. Please note that BLIP will only accept one command line argument. After entering the main command, you'll be prompted for the necessary information. 

A BLIP command can be run from the interactive interpreter and the command line using the same syntax. All of the commands are the same. Whether you choose to use our interpreter or the command line itself is a matter of preference. Both will run the exact same code.

#### Getting help
We've built-in some basic help to BLIP. To get our documentation you can type `ruby blip.rb usage` or `ruby blip.rb help` from the command line shell.

If you prefer to use our interactive interpreter, you can just enter `usage` or `help` from the `blip> ` prompt from within BLIP.

If you'd like to help us with writing documentation or improving our help files, please drop us a line by emailing the address above.


### Legalese (for those of you who are into that)

#### This program is released under the MIT License.

Copyright (c) 2013 Flying Apple Space Technologies.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.