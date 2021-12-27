set NAME=%1
"C:\Program Files\OpenSCAD\openscad.exe" -o "nametags\nametag-%NAME%-simple.stl" -D "username=""%NAME%""" -D "model=""simple""" nametaggenerator.scad
"C:\Program Files\OpenSCAD\openscad.exe" -o "nametags\nametag-%NAME%-case.stl" -D "username=""%NAME%""" -D "model=""o""" nametaggenerator.scad
"C:\Program Files\OpenSCAD\openscad.exe" -o "nametags\nametag-%NAME%-plate.stl" -D "username=""%NAME%""" -D "model=""i""" nametaggenerator.scad
"C:\Program Files\OpenSCAD\openscad.exe" -o "nametags\nametag-%NAME%-bottom.stl" -D "username=""%NAME%""" -D "model=""b""" nametaggenerator.scad
"C:\Program Files\OpenSCAD\openscad.exe" -o "nametags\nametag-%NAME%.png" --imgsize 1920,1080 --viewall --autocenter --colorscheme "DeepOcean" -D "username=""%NAME%""" -D "model=""assembled""" nametaggenerator.scad
