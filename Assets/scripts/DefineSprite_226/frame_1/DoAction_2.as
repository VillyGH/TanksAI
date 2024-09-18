_root.keys.isMouse = false;
mouseListener = new Object();
mouseListener.onMouseDown = function()
{
   _root.keys.isMouse = true;
};
mouseListener.onMouseUp = function()
{
   _root.keys.isMouse = false;
};
Mouse.addListener(mouseListener);
