liftbot
=========

The High Altitude Balloon Lift Calculation Program

Written by Eric Lujan for Ruby 1.9.3-head.

Based on research by Amanda Maxham, Eric Lujan, and Jake Lee conducted at the University of Nevada, Las Vegas.

Please send feedback, questions, and comments to lujane@unlv.nevada.edu.

**Note:** liftbot is a work-in-progress, and is based on perfectly ideal conditions. Although it may get pretty close to the actual results, it cannot perfectly predict all of the values. It is not to be relyed completely upon for your balloon launch, but to be used as a reference for further research.

### Usage

#### Requirements
liftbot is pretty low-maintenence and will run on any OS that supports Ruby. It was designed specifically with *Ruby 1.9.3* in mind, but you can probably get away with running an older or newer version of Ruby if necessary. You'll know it doesn't work in your version if it doesn't work. That being said, here's a few recommendations:

- Use RVM if on a Mac, Linux, or UNIX system (if you don't know what that is, it's a utility that lets you install and manage multiple versions of Ruby)
- To maximize your compatibility with liftbot (and most other Ruby programs), run `rvm install 1.9.3-head && rvm use 1.9.3 --default` from the command line. You'll make life easier on yourself (and Ruby developers too).
- If you're a Windows user, you can install Ruby via a downloadable .exe file from [here](http://rubyinstaller.org/downloads/). Make sure you grab the one for 1.9.3.
- If you encounter any bugs, please help us fix them. You can email me with bug reports, or if you're a Ruby developer, we'd glad to get your advice on how to make liftbot better.

#### Running liftbot
In its current Ruby version, liftbot has no graphical user interface and must be run from the command line. Open up your terminal, change to the directory where you downloaded liftbot and type `ruby liftbot.rb` to start the interactive command line interpreter. You will then be prompted for all of the necessary information.

The program calculates 4 values:
* Amount to fill the ballon with at launch
* Volume of lift gas in the balloon at altitude to attain specified target lift force at altitude
* Volume of lift gas to attain specified target lift at altitude, converted to STP to make analysis easier
* Difference between volume to attain specified target lift at altitude and amount you filled the balloon with:

The last 3 values are useful when you want to gain a certain lift at a certain altitude (for example, 0 lift at a certain altitude for neutral buoyancy). If you just want a simple lift calculation, you can ignore these values and focus on the first result. You also don't have to worry about the prompts with the words "Desired Altitude" in them. They are not used for calculating the first result.

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