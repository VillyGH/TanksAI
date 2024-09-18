class ObjectMap
{
   var xSize;
   var ySize;
   var rowCount;
   var colCount;
   var typCount;
   var mapArray;
   var nameArray;
   function ObjectMap(rows, cols, types, xPixels, yPixels)
   {
      this.xSize = xPixels;
      this.ySize = yPixels;
      this.rowCount = rows;
      this.colCount = cols;
      this.typCount = types;
      this.clearAll();
   }
   function addObject(name, type, xLoc, yLoc)
   {
      var _loc3_ = Math.floor(xLoc / this.xSize);
      var _loc2_ = Math.floor(yLoc / this.ySize);
      var _loc4_ = this.mapArray[type][_loc3_][_loc2_].length;
      this.nameArray[type][this.nameArray[type].length] = new Array(name,_loc3_,_loc2_,_loc4_);
      this.mapArray[type][_loc3_][_loc2_][_loc4_] = name;
   }
   function delObject(name, type)
   {
      var _loc2_ = this.findName(name,type);
      this.mapArray[type][this.nameArray[type][_loc2_][1]][this.nameArray[type][_loc2_][2]].splice(this.nameArray[type][_loc2_][3],1);
      this.nameArray[type].splice(_loc2_,1);
   }
   function movObject(name, type, xLoc, yLoc)
   {
      var _loc5_ = Math.floor(xLoc / this.xSize);
      var _loc4_ = Math.floor(yLoc / this.ySize);
      var _loc6_ = undefined;
      var _loc3_ = this.findName(name,type);
      this.mapArray[type][this.nameArray[type][_loc3_][1]][this.nameArray[type][_loc3_][2]].splice(this.nameArray[type][_loc3_][3],1);
      _loc6_ = this.mapArray[type][_loc5_][_loc4_].length;
      this.mapArray[type][_loc5_][_loc4_][_loc6_] = name;
      this.nameArray[type][_loc3_][1] = _loc5_;
      this.nameArray[type][_loc3_][2] = _loc4_;
      this.nameArray[type][_loc3_][3] = _loc6_;
   }
   function getOthers(name, type, target, size)
   {
      var _loc4_ = undefined;
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc12_ = this.findName(name,type);
      var _loc11_ = this.nameArray[type][_loc12_][1];
      var _loc8_ = this.nameArray[type][_loc12_][2];
      var _loc6_ = new Array();
      _loc4_ = _loc11_ - size;
      while(_loc4_ <= _loc11_ + size)
      {
         if(_loc4_ >= 0 && _loc4_ < this.colCount)
         {
            _loc2_ = _loc8_ - size;
            while(_loc2_ <= _loc8_ + size)
            {
               if(_loc2_ >= 0 && _loc2_ < this.rowCount)
               {
                  _loc3_ = 0;
                  while(_loc3_ < this.mapArray[target][_loc4_][_loc2_].length)
                  {
                     if(!(type == target && this.mapArray[target][_loc4_][_loc2_][_loc3_] == name))
                     {
                        _loc6_[_loc6_.length] = this.mapArray[target][_loc4_][_loc2_][_loc3_];
                     }
                     _loc3_ = _loc3_ + 1;
                  }
               }
               _loc2_ = _loc2_ + 1;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      return _loc6_;
   }
   function getList(type)
   {
      var _loc2_ = undefined;
      var _loc4_ = new Array();
      _loc2_ = 0;
      while(_loc2_ < this.nameArray[type].length)
      {
         _loc4_[_loc2_] = this.nameArray[type][_loc2_][0];
         _loc2_ = _loc2_ + 1;
      }
      return _loc4_;
   }
   function getAt(xLoc, yLoc, type)
   {
      var _loc4_ = Math.floor(xLoc / this.xSize);
      var _loc3_ = Math.floor(yLoc / this.ySize);
      var _loc2_ = undefined;
      var _loc6_ = new Array();
      _loc2_ = 0;
      while(_loc2_ < this.mapArray[type][_loc4_][_loc3_].length)
      {
         _loc6_[_loc2_] = this.mapArray[type][_loc4_][_loc3_][_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      return _loc6_;
   }
   function getArea(xLoc, yLoc, type, size)
   {
      var _loc4_ = undefined;
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc9_ = Math.floor(xLoc / this.xSize);
      var _loc8_ = Math.floor(yLoc / this.ySize);
      var _loc5_ = new Array();
      _loc4_ = _loc9_ - size;
      while(_loc4_ <= _loc9_ + size)
      {
         if(_loc4_ >= 0 && _loc4_ < this.colCount)
         {
            _loc2_ = _loc8_ - size;
            while(_loc2_ <= _loc8_ + size)
            {
               if(_loc2_ >= 0 && _loc2_ < this.rowCount)
               {
                  _loc3_ = 0;
                  while(_loc3_ < this.mapArray[type][_loc4_][_loc2_].length)
                  {
                     _loc5_[_loc5_.length] = this.mapArray[type][_loc4_][_loc2_][_loc3_];
                     _loc3_ = _loc3_ + 1;
                  }
               }
               _loc2_ = _loc2_ + 1;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      return _loc5_;
   }
   function clearAll()
   {
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      this.nameArray = new Array(this.typCount);
      this.mapArray = new Array(this.typCount);
      _loc4_ = 0;
      while(_loc4_ < this.typCount)
      {
         this.nameArray[_loc4_] = new Array();
         this.mapArray[_loc4_] = new Array(this.colCount);
         _loc3_ = 0;
         while(_loc3_ < this.colCount)
         {
            this.mapArray[_loc4_][_loc3_] = new Array(this.rowCount);
            _loc2_ = 0;
            while(_loc2_ < this.rowCount)
            {
               this.mapArray[_loc4_][_loc3_][_loc2_] = new Array();
               _loc2_ = _loc2_ + 1;
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function findName(name, type)
   {
      var _loc2_ = undefined;
      _loc2_ = 0;
      while(_loc2_ < this.nameArray[type].length)
      {
         if(this.nameArray[type][_loc2_][0] == name)
         {
            return _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      trace("help?");
   }
}
