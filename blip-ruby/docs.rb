def help

end

def usage

end

def about
	puts "===================================================================="
	puts "= The Balloon Landing Inference Program (BLIP)                     ="
	puts "===================================================================="
	puts ""
	puts "Compiled for Ruby 1.9.3-head."
	puts "Released under the MIT license by Flying Apple Space Technologies."
	puts "Developed by Eric Lujan at the University of Nevada, Las Vegas."
	puts "Based on research by Amanda Maxham, Ph.D, Eric Lujan, Jake Lee, Ian Rabago, and James Crist."
	puts ""
	puts "== CURRENT VERSION =="
	puts "Version 0.0.1 : Initial release. (8 May 2013)"
	puts ""
	puts "== BACKGROUND =="
	puts "Dr. Maxham originally noticed that the tracks of balloon ground paths followed a proportional"
	puts "and mirrored path. The two legs of the path were formed by the launch point, the burst point,"
	puts "and the landing point. The lenghts of these legs are roughly proportional, and all three of these"
	puts "major points lie on a straight line. James Crist, using the Pythagorean Theorem, derived a"
	puts "relationship between the positions of these points and created an algebraic equation to model them."
	puts "Eric Lujan and Jake Lee took this equation, tweaked it, and programmed it into ANSI C application."
	puts "This application was re-written in the Ruby programming language and is having new features constantly"
	puts "added to it by the original developers (Lujan and Lee). It is very much a work in progress."
	puts ""
	puts "== SCOPE =="
	puts "The scope of this application is, at the moment, very limited and is more of an academic exercise than"
	puts "a practical on-board flight computer in its own right. However, steps are being taken to develop a system"
	puts "to integrate the Ruby version of BLIP with a Raspberry Pi and a GPS unit to create an on-board flight"
	puts "prediction and data recording system. In the future, I would also like to have this program be able to"
	puts "parse files containing lists of GPGGA strings to predict a landing point and then compare the accuracy"
	puts "of the predicted landing point to the last data point in the file to help improve our algorithm."
	puts "BLIP is embryonic. However, it continues to grow all the time and is constantly evolving. That's a good thing."
	puts ""
	puts "== SOURCE CODE =="
	puts "BLIP is an open-source program which is released under the terms of the MIT license."
	puts "The Ruby source code for BLIP is available for download from the following Git repository: "
	puts "https://github.com/ericluwolf/blip/"
	puts "Please know that the source code on this repository may be experimental, so be sure you know which"
	puts "commit you are downloading before deploying BLIP into a production environment."
	puts ""
	puts "== CONTACT =="
	puts "For support or inquiry about the BLIP project (or Flying Apple Space Technologies), feel free to email Eric"
	puts "Lujan at lujane@unlv.nevada.edu. You can submit bug reports about BLIP by emailing that address or leaving"
	puts "a production comment on the GitHub repository."
	puts ""
	puts "THANK YOU FOR YOUR INTEREST IN BLIP."
	puts "If this about text was too long to read on your display, type 'ruby blip.rb about | less' on a UNIX system."
	puts "[EOF]"
end
	