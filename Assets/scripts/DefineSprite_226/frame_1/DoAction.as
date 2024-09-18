_root.keys.isLeft = false;
_root.keys.isRight = false;
_root.keys.isUp = false;
_root.keys.isDown = false;
_root.keys.isSpace = false;
_root.keys.isNext = false;
keyListener = new Object();
keyListener.onKeyDown = function()
{
   switch(Key.getCode())
   {
      case 37:
      case 65:
         _root.keys.isLeft = true;
         break;
      case 39:
      case 68:
         _root.keys.isRight = true;
         break;
      case 38:
      case 87:
         _root.keys.isUp = true;
         break;
      case 40:
      case 83:
         _root.keys.isDown = true;
         break;
      case 17:
         _root.keys.isNext = true;
         break;
      case 32:
         _root.keys.isSpace = true;
   }
};
keyListener.onKeyUp = function()
{
   switch(Key.getCode())
   {
      case 37:
      case 65:
         _root.keys.isLeft = false;
         break;
      case 39:
      case 68:
         _root.keys.isRight = false;
         break;
      case 38:
      case 87:
         _root.keys.isUp = false;
         break;
      case 40:
      case 83:
         _root.keys.isDown = false;
         break;
      case 17:
         _root.keys.isNext = false;
         break;
      case 32:
         _root.keys.isSpace = false;
   }
};
Key.addListener(keyListener);
