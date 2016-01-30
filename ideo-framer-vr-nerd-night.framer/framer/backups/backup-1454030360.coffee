# import the VRComponent
{VRComponent, VRLayer} = require "VRComponent"

# using six images we create the cube map environment
vr = new VRComponent
	front: "images/front.jpg"
	right: "images/right.jpg"
	left: "images/left.jpg"
	back: "images/back.jpg"
	bottom: "images/bottom.jpg"
	top: "images/top.jpg"
	
# on window resize we make sure the vr component fills the entire screen
window.onresize = ->
	vr.size = Screen.size
	
# enable click events (turns off click & drag to navigate on desktop)
vr.orientationLayer = false

icon = new VRLayer
    image:"images/icons/warning.svg"
    heading: 15
    elevation: 6

vr.projectLayer(icon)

icon.on Events.Click, ->
    if warningText.opacity == 1
    	warningText.states.switch("fadeOut")
    else
    	warningText.states.switch("fadeIn")

warningText = new VRLayer
	width: 215
	height: 50
	html: "<p style='font-size:22px; padding: 10px;'>Here's your warning</p>"
	backgroundColor: 'rgba(0, 0, 0, .65)'
	elevation: 1.5
	heading: 15
	opacity: 0

warningText.states.add
    fadeOut: {
    	opacity: 0
    }
    fadeIn: {
    	opacity: 1
    }

vr.projectLayer(warningText)

vr.on Events.OrientationDidChange, (data) ->
    heading = 	data.heading # capture y axis rotation from 0-360°
    # print data.heading # print heading to screen