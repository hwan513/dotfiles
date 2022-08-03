local function openHTML(files)
	for _, file in pairs(files) do
		if file:sub(-3) == ".md" or file:sub(-4) == ".css" then
			os.execute(
				[[cd /Users/henrywang/Documents/scribbles/cv_stuff/ && /opt/homebrew/bin/pandoc --standalone cv_sot.md --css cv.css --output cv_sot.html --strip-comments --metadata pagetitle="cv" && open --background ./cv_sot.html]]
			)
		end
	end
end

-- myWatcher = hs.pathwatcher.new("/Users/henrywang/Documents/scribbles/cv_stuff/", openHTML):start()
