function addWall(x, y, type)
{
   s;
   _root.wall_container.attachMovie("wall","wall" + this.wallCount,_root.wall_container.getNextHighestDepth());
   _root.wall_container["wall" + this.wallCount]._x = x;
   _root.wall_container["wall" + this.wallCount]._y = y;
   _root.wall_container["wall" + this.wallCount].gotoAndStop(type);
   _root.wall_container["wall" + this.wallCount].idNumber = this.wallCount;
   this.objMap.addObject(this.wallCount,0,x,y);
   this.wallCount = this.wallCount + 1;
}
function addTank(x, y, type)
{
   _root.tank_container.attachMovie("enemy_" + type,"tank" + this.tankCount,_root.tank_container.getNextHighestDepth());
   _root.tank_container["tank" + this.tankCount]._x = x;
   _root.tank_container["tank" + this.tankCount]._y = y;
   _root.tank_container["tank" + this.tankCount].idNumber = this.tankCount;
   _root.tank_container["tank" + this.tankCount].aiType = type;
   _root["enemy" + type + "_Create"].call(_root.tank_container["tank" + this.tankCount]);
   this.objMap.addObject(this.tankCount,1,x,y);
   _root.tankCount = _root.tankCount + 1;
}
function addPlayer(x, y)
{
   _root.tank_container.attachMovie("player","player",_root.tank_container.getNextHighestDepth());
   _root.tank_container.player._x = x;
   _root.tank_container.player._y = y;
   _root.tank_container.player.base._rotation = 90;
   _root.player_Create.call(_root.tank_container.player);
   _root.tank_container.player.rotate = new mx.transitions.Tween(_root.tank_container.player,"currentRotation",mx.transitions.easing.None.easeNone,90,90,10,false);
   this.objMap.addObject(-1,1,x,y);
}
function addTread(x, y, r)
{
   if(_root.tread_container["tread" + this.treadCount] != undefined)
   {
      _root.tread_container["tread" + this.treadCount].removeMovieClip();
   }
   _root.tread_container.attachMovie("tank_tread","tread" + this.treadCount,_root.tread_container.getNextHighestDepth());
   _root.tread_container["tread" + this.treadCount]._x = x;
   _root.tread_container["tread" + this.treadCount]._y = y;
   _root.tread_container["tread" + this.treadCount]._rotation = r;
   this.treadCount = this.treadCount + 1;
   if(this.treadCount > this.maxTreads)
   {
      this.treadCount = 0;
   }
}
function addMuzzleFlash(x, y)
{
   _root.explosion_container.attachMovie("tank_muzzleflash","explosion" + this.explosionCount,_root.explosion_container.getNextHighestDepth());
   _root.explosion_container["explosion" + this.explosionCount]._x = x;
   _root.explosion_container["explosion" + this.explosionCount]._y = y;
   this.explosionCount = this.explosionCount + 1;
   if(this.explosionCount > this.maxExplosions)
   {
      this.explosionCount = 0;
   }
}
function addBullet(x, y, r, hits, owner)
{
   _root.bullet_container.attachMovie("bullet","bullet" + this.bulletCount,_root.bullet_container.getNextHighestDepth());
   _root.bullet_container["bullet" + this.bulletCount]._x = x;
   _root.bullet_container["bullet" + this.bulletCount]._y = y;
   _root.bullet_container["bullet" + this.bulletCount]._rotation = r;
   _root.bullet_container["bullet" + this.bulletCount].idNumber = this.bulletCount;
   _root.bullet_container["bullet" + this.bulletCount].hitMax = hits;
   _root.bullet_container["bullet" + this.bulletCount].tankOwner = owner;
   _root.bullet_shot.start(0,0);
   _root.bullet_Create.call(_root.bullet_container["bullet" + this.bulletCount]);
   this.objMap.addObject(this.bulletCount,2,x,y);
   this.bulletCount = this.bulletCount + 1;
   if(this.bulletCount > this.maxBullets)
   {
      this.bulletCount = 0;
   }
}
function addBulletSmoke(x, y)
{
   if(_root.smoke_container["smoke" + this.smokeCount] != undefined)
   {
      _root.smoke_container["smoke" + this.smokeCount].removeMovieClip();
   }
   _root.smoke_container.attachMovie("bullet_smoke","smoke" + this.smokeCount,_root.smoke_container.getNextHighestDepth());
   _root.smoke_container["smoke" + this.smokeCount]._x = x;
   _root.smoke_container["smoke" + this.smokeCount]._y = y;
   this.smokeCount = this.smokeCount + 1;
   if(this.smokeCount > this.maxSmokes)
   {
      this.smokeCount = 0;
   }
}
function addBulletExplosion(x, y)
{
   _root.explosion_container.attachMovie("bullet_explosion","explosion" + this.explosionCount,_root.explosion_container.getNextHighestDepth());
   _root.explosion_container["explosion" + this.explosionCount]._x = x;
   _root.explosion_container["explosion" + this.explosionCount]._y = y;
   this.explosionCount = this.explosionCount + 1;
   if(this.explosionCount > this.maxExplosions)
   {
      this.explosionCount = 0;
   }
}
function addBulletBounceExp(x, y)
{
   _root.explosion_container.attachMovie("bullet_bounceExp","explosion" + this.explosionCount,_root.explosion_container.getNextHighestDepth());
   _root.explosion_container["explosion" + this.explosionCount]._x = x;
   _root.explosion_container["explosion" + this.explosionCount]._y = y;
   this.explosionCount = this.explosionCount + 1;
   if(this.explosionCount > this.maxExplosions)
   {
      this.explosionCount = 0;
   }
}
function addBomb(x, y, owner)
{
   _root.bomb_container.attachMovie("bomb","bomb" + this.bombCount,_root.bomb_container.getNextHighestDepth());
   _root.bomb_container["bomb" + this.bombCount]._x = x;
   _root.bomb_container["bomb" + this.bombCount]._y = y;
   _root.bomb_container["bomb" + this.bombCount].tankOwner = owner;
   _root.bomb_container["bomb" + this.bombCount].idNumber = this.bombCount;
   _root.bomb_container["bomb" + this.bombCount].isActivated = 0;
   this.objMap.addObject(this.bombCount,3,x,y);
   this.bombCount = this.bombCount + 1;
   if(this.bombCount > this.maxBombs)
   {
      this.bombCount = 0;
   }
}
function addBombExplosion(x, y)
{
   if(_root.explosion_container["explosion" + this.explosionCount] != undefined)
   {
      _root.explosion_container["explosion" + this.explosionCount].removeMovieClip();
   }
   _root.explosion_container.attachMovie("bomb_explosion","explosion" + this.explosionCount,_root.explosion_container.getNextHighestDepth());
   _root.explosion_container["explosion" + this.explosionCount]._x = x;
   _root.explosion_container["explosion" + this.explosionCount]._y = y;
   _root.explosion_container["explosion" + this.explosionCount].idNumber = this.explosionCount;
   this.objMap.addObject(this.explosionCount,4,x,y);
   this.explosionCount = this.explosionCount + 1;
   if(this.explosionCount > this.maxExplosions)
   {
      this.explosionCount = 0;
   }
}
function addTankExplosion(x, y)
{
   if(_root.explosion_container["explosion" + this.explosionCount] != undefined)
   {
      _root.explosion_container["explosion" + this.explosionCount].removeMovieClip();
   }
   _root.explosion_container.attachMovie("tank_explosion","explosion" + this.explosionCount,_root.explosion_container.getNextHighestDepth());
   _root.explosion_container["explosion" + this.explosionCount]._x = x;
   _root.explosion_container["explosion" + this.explosionCount]._y = y;
   this.explosionCount = this.explosionCount + 1;
   if(this.explosionCount > this.maxExplosions)
   {
      this.explosionCount = 0;
   }
}
function addWallExplosion(x, y)
{
   if(_root.explosion_container["explosion" + this.explosionCount] != undefined)
   {
      _root.explosion_container["explosion" + this.explosionCount].removeMovieClip();
   }
   _root.explosion_container.attachMovie("wall_explosion","explosion" + this.explosionCount,_root.explosion_container.getNextHighestDepth());
   _root.explosion_container["explosion" + this.explosionCount]._x = x;
   _root.explosion_container["explosion" + this.explosionCount]._y = y;
   this.explosionCount = this.explosionCount + 1;
   if(this.explosionCount > this.maxExplosions)
   {
      this.explosionCount = 0;
   }
}
function addDeathMark(x, y)
{
   _root.tread_container.attachMovie("tank_death","death" + this.killCount,_root.tread_container.getNextHighestDepth());
   _root.tread_container["death" + this.killCount]._x = x;
   _root.tread_container["death" + this.killCount]._y = y;
   this.killCount = this.killCount + 1;
}
function clearBoard()
{
   _root.tank_container.player.removeMovieClip();
   x = 0;
   while(x < _root.tankCount)
   {
      _root.tank_container["tank" + x].removeMovieClip();
      x++;
   }
   x = 0;
   while(x < _root.maxBullets)
   {
      _root.bullet_container["bullet" + x].removeMovieClip();
      x++;
   }
   x = 0;
   while(x < _root.maxSmokes)
   {
      _root.bullet_container["smoke" + x].removeMovieClip();
      x++;
   }
   x = 0;
   while(x < _root.maxBombs)
   {
      _root.bomb_container["bomb" + x].removeMovieClip();
      x++;
   }
   x = 0;
   while(x < _root.maxExplosions)
   {
      _root.explosion_container["explosion" + x].removeMovieClip();
      x++;
   }
   x = 0;
   while(x < _root.killCount)
   {
      _root.tread_container["death" + x].removeMovieClip();
      x++;
   }
   x = 0;
   while(x < _root.maxTreads)
   {
      _root.tread_container["tread" + x].removeMovieClip();
      x++;
   }
   x = 0;
   while(x < _root.wallCount)
   {
      _root.wall_container["wall" + x].removeMovieClip();
      x++;
   }
   this.objMap.clearAll();
   this.node_Clear();
   treadCount = 0;
   smokeCount = 0;
   bulletCount = 0;
   explosionCount = 0;
   bombCount = 0;
   wallCount = 0;
   tankCount = 0;
   killCount = 0;
}
function loadBoard(level)
{
   var _loc5_ = this.mapData[level];
   var _loc6_ = this.enemyData[level];
   var _loc7_ = this.nodeData[level];
   var _loc8_ = _loc5_[0].length;
   var _loc9_ = _loc5_.length;
   var _loc12_ = undefined;
   var _loc11_ = undefined;
   var _loc4_ = undefined;
   var _loc3_ = undefined;
   this.clearBoard();
   _loc4_ = 0;
   while(_loc4_ < _loc9_)
   {
      _loc3_ = 0;
      while(_loc3_ < _loc8_)
      {
         switch(_loc5_[_loc4_][_loc3_])
         {
            case 0:
               break;
            case 1:
            case 2:
            case 3:
            case 4:
               this.addWall(_loc3_ * this.cellW + 0.5 * _root.cellW,_loc4_ * this.cellH + 0.5 * this.cellH,_loc5_[_loc4_][_loc3_]);
               break;
            case 5:
               this.addPlayer(_loc3_ * this.cellW + 0.5 * _root.cellW,_loc4_ * this.cellH + 0.5 * this.cellH);
               break;
            case 6:
               this.addTank(_loc3_ * this.cellW + 0.5 * this.cellW,_loc4_ * this.cellH + 0.5 * this.cellH,_loc6_[this.tankCount]);
               break;
            case 9:
               trace(this.nodeCount);
               this.node_Add(_loc3_ * this.cellW + 0.5 * this.cellW,_loc4_ * this.cellH + 0.5 * this.cellH,_loc7_[this.nodeCount],this.cellW,this.cellH);
               break;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc4_ = _loc4_ + 1;
   }
   this.node_Calculate();
}
function newLevel()
{
   this.currentLevel = this.currentLevel + 1;
   this.currentEnemies = this.enemyData[currentLevel].length;
   _root.attachMovie("mission_intro","mission_intro",_root.getNextHighestDepth());
}
function endLevel()
{
   _root.pauseGame();
   _root.attachMovie("mission_complete","mission_complete",_root.getNextHighestDepth());
   _root.mission_complete._x = 400;
   _root.mission_complete._y = 125;
}
function endGame()
{
   _root.pauseGame();
   if(_root.mission_failed)
   {
      _root.mission_failed.removeMovieClip();
   }
   _root.attachMovie("mission_failed","mission_failed",_root.getNextHighestDepth());
   _root.mission_failed._x = 400;
   _root.mission_failed._y = 125;
}
function pauseGame()
{
   var _loc2_ = undefined;
   var _loc3_ = _root.objMap.getList(3);
   var _loc4_ = _root.objMap.getList(4);
   if(_root.isPaused == 0)
   {
      _root.isPaused = 1;
      _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _root.bomb_container["bomb" + _loc3_[_loc2_]].base.stop();
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         _root.explosion_container["explosion" + _loc4_[_loc2_]].stop();
         _loc2_ = _loc2_ + 1;
      }
   }
   else
   {
      _root.isPaused = 0;
      _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_root.bomb_container["bomb" + _loc3_[_loc2_]].isActivated == 1)
         {
            _root.bomb_container["bomb" + _loc3_[_loc2_]].base.play();
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         _root.explosion_container["explosion" + _loc4_[_loc2_]].play();
         _loc2_ = _loc2_ + 1;
      }
   }
}
function bullet_Create()
{
   this.hitCount = 0;
   this.smokeTimer = 0;
   this.speedBullet = 5;
}
function bullet_Move()
{
   newX = this.speedBullet * Math.sin(_root.toRadians(this._rotation + 90));
   newY = this.speedBullet * Math.cos(_root.toRadians(this._rotation + 90));
   this._x += newX;
   this._y -= newY;
   _root.objMap.movObject(this.idNumber,2,this._x,this._y);
   if(this.smokeTimer == 0)
   {
      _root.addBulletSmoke(this._x,this._y);
      this.smokeTimer = 1;
   }
   else
   {
      this.smokeTimer = this.smokeTimer - 1;
   }
}
function bullet_CheckDeath()
{
   if(this.hitCount >= this.hitMax)
   {
      if(this.tankOwner == -1)
      {
         _root.tank_container.player.fireCount = _root.tank_container.player.fireCount + 1;
      }
      else
      {
         _root.tank_container["tank" + this.tankOwner].fireCount = _root.tank_container["tank" + this.tankOwner].fireCount + 1;
      }
      _root.addBulletExplosion(this._x,this._y);
      _root.objMap.delObject(this.idNumber,2);
      this.removeMovieClip();
   }
}
function bullet_CheckBullet(idA, idB)
{
   var _loc2_ = _root.bullet_container["bullet" + idA];
   var _loc3_ = _root.bullet_container["bullet" + idB];
   if(_loc2_.hitTest(_loc3_) == true)
   {
      _loc2_.hitCount = _loc2_.hitMax;
      _root.bullet_explosion.start(0,0);
      _loc3_.hitCount = _loc3_.hitMax;
   }
}
function bullet_CheckWall(idA, idB)
{
   var _loc3_ = _root.bullet_container["bullet" + idA];
   var _loc4_ = _root.wall_container["wall" + idB];
   var _loc7_ = undefined;
   var _loc8_ = undefined;
   var _loc5_ = undefined;
   var _loc9_ = undefined;
   var _loc6_ = undefined;
   if(_loc4_._currentframe != 4)
   {
      if(_loc4_.base.hitTest(_loc3_._x,_loc3_._y,false) == true)
      {
         _loc7_ = _root.toDegrees(Math.atan(0.5 * _loc4_.base._width / (0.5 * _loc4_.base._height)));
         _loc8_ = _root.toDegrees(Math.atan(0.5 * _loc4_.base._height / (0.5 * _loc4_.base._width)));
         _loc5_ = _root.calcAngle(_loc3_._x,_loc4_._x,_loc3_._y,_loc4_._y);
         _loc9_ = _loc3_._rotation;
         if(_root.isBetween(_loc7_ * -1,_loc7_,_loc5_))
         {
            if(_loc3_._rotation > 0)
            {
               _loc6_ = _loc3_._rotation * -1;
            }
         }
         else if(_root.isBetween(90 - _loc8_,90 + _loc8_,_loc5_))
         {
            if(_loc3_._rotation < -90 || _loc3_._rotation > 90)
            {
               _loc6_ = 90 - (_loc3_._rotation - 90);
            }
         }
         else if(_root.isBetween(180 - _loc7_,180,_loc5_) || _root.isBetween(-180,-180 + _loc7_,_loc5_))
         {
            if(_loc3_._rotation < 0)
            {
               _loc6_ = _loc3_._rotation * -1;
            }
         }
         else if(_root.isBetween(-90 - _loc8_,-90 + _loc8_,_loc5_))
         {
            if(_loc3_._rotation > -90 || _loc3_._rotation < 90)
            {
               _loc6_ = 90 - (_loc3_._rotation - 90);
            }
         }
         if(_loc6_ != _loc9_)
         {
            _loc3_.hitCount = _loc3_.hitCount + 1;
            if(_loc3_.hitCount == 1)
            {
               _root.bullet_bounce.start(0,0);
               _root.addBulletBounceExp(_loc3_._x,_loc3_._y);
            }
            else if(_loc3_.hitCount == 2)
            {
               _root.bullet_explosion.start(0,0);
            }
            if(_loc3_.hitCount < _loc3_.hitMax)
            {
               _loc3_._rotation = _loc6_;
               this.bullet_Move.call(_loc3_);
            }
         }
      }
   }
}
function bullet_CheckBomb(idA, idB)
{
   var _loc2_ = _root.bullet_container["bullet" + idA];
   var _loc3_ = _root.bomb_container["bomb" + idB];
   if(_loc2_.hitTest(_loc3_.base) == true)
   {
      _loc2_.hitCount = _loc2_.hitMax;
      _loc3_.explode = 1;
   }
}
function bomb_CheckDeath()
{
   if(this.explode == 1)
   {
      if(this.tankOwner == -1)
      {
         _root.tank_container.player.mineCount = _root.tank_container.player.mineCount + 1;
      }
      else
      {
         _root.tank_container["tank" + this.tankOwner].mineCount = _root.tank_container["tank" + this.tankOwner].mineCount + 1;
      }
      _root.addBombExplosion(this._x,this._y);
      _root.mine_explosion.start(0,0);
      _root.objMap.delObject(this.idNumber,3);
      this.removeMovieClip();
   }
}
function explosion_CheckTank(idA, idB)
{
   var _loc3_ = _root.explosion_container["explosion" + idA];
   var _loc2_ = _root.tank_container[idB == -1 ? "player" : "tank" + idB];
   if(_loc3_.detect.hitTest(_loc2_) == true)
   {
      _loc2_.isDestroyed = 1;
   }
}
function explosion_CheckBullet(idA, idB)
{
   var _loc3_ = _root.explosion_container["explosion" + idA];
   var _loc2_ = _root.bullet_container["bullet" + idB];
   if(_loc3_.detect.hitTest(_loc2_) == true)
   {
      _loc2_.hitCount = _loc2_.hitMax;
   }
}
function explosion_CheckWall(idA, idB)
{
   var _loc3_ = _root.explosion_container["explosion" + idA];
   var _loc2_ = _root.wall_container["wall" + idB];
   if(_loc2_._currentframe == 3)
   {
      if(_loc3_.detect.hitTest(_loc2_) == true)
      {
         _root.addWallExplosion(_loc2_._x,_loc2_._y);
         _root.objMap.delObject(_loc2_.idNumber,0);
         _loc2_.removeMovieClip();
      }
   }
}
function explosion_CheckBomb(idA, idB)
{
   var _loc3_ = _root.explosion_container["explosion" + idA];
   var _loc2_ = _root.bomb_container["bomb" + idB];
   if(_loc3_.detect.hitTest(_loc2_) == true)
   {
      _loc2_.explode = 1;
   }
}
function tank_CheckTank(idA, idB)
{
   var _loc2_ = _root.tank_container[idA == -1 ? "player" : "tank" + idA];
   var _loc3_ = _root.tank_container[idB == -1 ? "player" : "tank" + idB];
   var _loc5_ = 3;
   var _loc4_ = undefined;
   var _loc7_ = undefined;
   var _loc6_ = undefined;
   if((_loc2_.base.a.hitTest(_loc3_.base) == true || _loc2_.base.b.hitTest(_loc3_.base) == true || _loc2_.base.c.hitTest(_loc3_.base) == true || _loc2_.base.d.hitTest(_loc3_.base) == true || _loc2_.base.e.hitTest(_loc3_.base) == true || _loc2_.base.f.hitTest(_loc3_.base) == true || _loc2_.base.g.hitTest(_loc3_.base) == true) && (_loc3_.base.a.hitTest(_loc2_.base) == true || _loc3_.base.b.hitTest(_loc2_.base) == true || _loc3_.base.c.hitTest(_loc2_.base) == true || _loc3_.base.d.hitTest(_loc2_.base) == true || _loc3_.base.e.hitTest(_loc2_.base) == true || _loc3_.base.f.hitTest(_loc2_.base) == true || _loc3_.base.g.hitTest(_loc2_.base) == true))
   {
      _loc4_ = Math.abs(_root.toDegrees(Math.atan((_loc2_._x - _loc3_._x) / (_loc3_._y - _loc2_._y))));
      if(_loc2_._x > _loc3_._x && _loc2_._y > _loc3_._y)
      {
         _loc4_ = 90 - _loc4_ + 90;
      }
      else if(_loc2_._x < _loc3_._x && _loc2_._y >= _loc3_._y)
      {
         _loc4_ += 180;
      }
      else if(_loc2_._x < _loc3_._x && _loc2_._y < _loc3_._y)
      {
         _loc4_ = 90 - _loc4_ + 270;
      }
      if(_loc4_ > 180)
      {
         _loc4_ = -1 * (360 - _loc4_);
      }
      _loc7_ = _loc5_ * Math.sin(_root.toRadians(_loc4_));
      _loc6_ = _loc5_ * Math.cos(_root.toRadians(_loc4_));
      _loc2_._x += _loc7_;
      _loc2_._y -= _loc6_;
      _loc3_._x -= _loc7_;
      _loc3_._y += _loc6_;
      _root.objMap.movObject(idA,1,_loc2_._x,_loc2_._y);
      _root.objMap.movObject(idB,1,_loc3_._x,_loc3_._y);
      _loc2_.disabled = 2;
      _loc3_.disabled = 2;
   }
}
function tank_CheckWall(idA, idB)
{
   var _loc2_ = _root.tank_container[idA == -1 ? "player" : "tank" + idA];
   var _loc3_ = _root.wall_container["wall" + idB];
   var _loc6_ = 3;
   var _loc5_ = undefined;
   var _loc7_ = undefined;
   var _loc4_ = undefined;
   if(_loc2_.base.a.hitTest(_loc3_) == true || _loc2_.base.b.hitTest(_loc3_) == true || _loc2_.base.c.hitTest(_loc3_) == true || _loc2_.base.d.hitTest(_loc3_) == true || _loc2_.base.e.hitTest(_loc3_) == true || _loc2_.base.f.hitTest(_loc3_) == true || _loc2_.base.g.hitTest(_loc3_) == true)
   {
      _loc5_ = _root.toDegrees(Math.atan(0.5 * _loc3_._width / (0.5 * _loc3_._height)));
      _loc7_ = _root.toDegrees(Math.atan(0.5 * _loc3_._height / (0.5 * _loc3_._width)));
      _loc4_ = Math.abs(_root.toDegrees(Math.atan((_loc2_._x - _loc3_._x) / (_loc3_._y - _loc2_._y))));
      if(_loc2_._x > _loc3_._x && _loc2_._y > _loc3_._y)
      {
         _loc4_ = 90 - _loc4_ + 90;
      }
      else if(_loc2_._x < _loc3_._x && _loc2_._y >= _loc3_._y)
      {
         _loc4_ += 180;
      }
      else if(_loc2_._x < _loc3_._x && _loc2_._y < _loc3_._y)
      {
         _loc4_ = 90 - _loc4_ + 270;
      }
      if(_loc4_ > 180)
      {
         _loc4_ = -1 * (360 - _loc4_);
      }
      _loc2_.disabled = 0;
      if(_root.isBetween(_loc5_ * -1,_loc5_,_loc4_))
      {
         _loc2_._y -= _loc6_;
      }
      else if(_root.isBetween(90 - _loc7_,90 + _loc7_,_loc4_))
      {
         _loc2_._x += _loc6_;
      }
      else if(_root.isBetween(180 - _loc5_,180,_loc4_) || _root.isBetween(-180,-180 + _loc5_,_loc4_))
      {
         _loc2_._y += _loc6_;
      }
      else if(_root.isBetween(-90 - _loc7_,-90 + _loc7_,_loc4_))
      {
         _loc2_._x -= _loc6_;
      }
      _root.objMap.movObject(idA,1,_loc2_._x,_loc2_._y);
   }
}
function tank_CheckBullet(idA, idB)
{
   var _loc3_ = _root.tank_container[idA == -1 ? "player" : "tank" + idA];
   var _loc2_ = _root.bullet_container["bullet" + idB];
   if(_loc3_.hitTest(_loc2_._x,_loc2_._y,true) == true)
   {
      _loc2_.hitCount = _loc2_.hitMax;
      _loc3_.isDestroyed = 1;
   }
}
function tank_CheckBomb(idA, idB)
{
   var _loc3_ = _root.tank_container[idA == -1 ? "player" : "tank" + idA];
   var _loc2_ = _root.bomb_container["bomb" + idB];
   if(_loc2_.isActivated == 0)
   {
      if(idA == _loc2_.tankOwner)
      {
         if(_loc2_.detection.hitTest(_loc3_.base) == false)
         {
            _loc2_.isActivated = 1;
            _loc2_.base.play();
         }
      }
   }
   else if(_loc2_.detection.hitTest(_loc3_.base) == true)
   {
      _loc2_.explode = 1;
   }
}
function player_Create()
{
   this.bulletMaxHits = 2;
   this.speedVehicle = 3;
   this.disabled = 0;
   this.fireCount = 5;
   this.mineCount = 2;
   this.isFiring = 0;
   this.isMining = 0;
   this.isTread = 0;
   this.isDestroyed = 0;
   this.tread_sound_delay = 0;
}
function player_RotateTurret()
{
   if(_root.gameOver != 1)
   {
      this.turret._rotation = _root.toDegrees(Math.atan2(_root._ymouse - this._y,_root._xmouse - this._x));
   }
}
function player_MoveTank()
{
   this.base._rotation = this.currentRotation % 360;
   if(this.disabled == 0)
   {
      this.targetRotation = 200;
      if(!(_root.keys.isUp && _root.keys.isDown) && !(_root.keys.isLeft && _root.keys.isRight))
      {
         if(_root.keys.isUp)
         {
            if(_root.keys.isLeft)
            {
               this.targetRotation = -45 + Math.floor(this.currentRotation / 360) * 360;
            }
            else if(_root.keys.isRight)
            {
               this.targetRotation = 45 + Math.floor(this.currentRotation / 360) * 360;
            }
            else
            {
               this.targetRotation = 0 + Math.floor(this.currentRotation / 360) * 360;
            }
         }
         else if(_root.keys.isDown)
         {
            if(_root.keys.isLeft)
            {
               this.targetRotation = -135 + Math.floor(this.currentRotation / 360) * 360;
            }
            else if(_root.keys.isRight)
            {
               this.targetRotation = 135 + Math.floor(this.currentRotation / 360) * 360;
            }
            else
            {
               this.targetRotation = 180 + Math.floor(this.currentRotation / 360) * 360;
            }
         }
         else if(_root.keys.isLeft)
         {
            this.targetRotation = -90 + Math.floor(this.currentRotation / 360) * 360;
         }
         else if(_root.keys.isRight)
         {
            this.targetRotation = 90 + Math.floor(this.currentRotation / 360) * 360;
         }
      }
      if(this.targetRotation != 200)
      {
         if(Math.abs(this.targetRotation - this.currentRotation) > 150 && Math.abs(this.targetRotation - this.currentRotation) < 210)
         {
            this.dir = -1;
            this.rotateTime = 0;
         }
         else
         {
            this.dir = 1;
            if(Math.abs(this.targetRotation - this.currentRotation) > 180)
            {
               if(this.currentRotation > 0)
               {
                  this.targetRotation = 360 + this.targetRotation;
               }
               else
               {
                  this.targetRotation += 360;
               }
            }
            this.rotateTime = Math.abs(this.targetRotation - this.currentRotation) / 5;
            this.rotate.continueTo(this.targetRotation,this.rotateTime);
         }
         this.oldX = this.speedVehicle * this.dir * Math.sin(_root.toRadians(this.base._rotation));
         this.oldY = this.speedVehicle * this.dir * Math.cos(_root.toRadians(this.base._rotation));
         this.stepX = this._x + this.oldX / (this.rotateTime / 10 + 1);
         this.stepY = this._y - this.oldY / (this.rotateTime / 10 + 1);
         this._x = this.stepX;
         this._y = this.stepY;
         _root.objMap.movObject(-1,1,this._x,this._y);
         if(this.isTread == 0)
         {
            _root.addTread(this._x,this._y,this.base._rotation);
            this.isTread = 2;
            this.tread_sound_delay = this.tread_sound_delay + 1;
            if(this.tread_sound_delay == 2)
            {
               _root.treads.start(0,0);
               this.tread_sound_delay = 0;
            }
         }
         else
         {
            this.isTread = this.isTread - 1;
         }
      }
      else
      {
         this.rotate.stop();
      }
   }
   else
   {
      this.disabled = this.disabled - 1;
   }
}
function player_CheckDeath()
{
   if(this.isDestroyed == 1)
   {
      _root.addTankExplosion(this._x,this._y);
      _root.addDeathMark(this._x,this._y);
      _root.pauseGame();
      _root.gameOver = 1;
      _root.objMap.delObject(-1,1);
      this.removeMovieClip();
   }
}
function player_FireBullet()
{
   var _loc5_ = undefined;
   var _loc4_ = undefined;
   var _loc3_ = undefined;
   if(_root.keys.isMouse && this.isFiring == 0)
   {
      if(this.fireCount != 0)
      {
         _loc5_ = this._x + Math.cos(_root.toRadians(this.turret._rotation)) * 30;
         _loc4_ = this._y + Math.sin(_root.toRadians(this.turret._rotation)) * 30;
         _loc3_ = _root.objMap.getOthers(-1,1,0,1);
         x = 0;
         while(x < _loc3_.length)
         {
            if(_root.wall_container["wall" + _loc3_[x]].hidden.hitTest(_loc5_,_loc4_,false) == true)
            {
               return undefined;
            }
            x++;
         }
         _root.addBullet(_loc5_,_loc4_,this.turret._rotation,this.bulletMaxHits,-1);
         _root.addMuzzleFlash(_loc5_,_loc4_);
         this.isFiring = 3;
         if(this.fireCount != 0)
         {
            this.fireCount = this.fireCount - 1;
         }
      }
   }
   if(!_root.keys.isMouse)
   {
      if(this.isFiring != 0)
      {
         this.isFiring = this.isFiring - 1;
      }
   }
}
function player_FireMine()
{
   if(_root.keys.isSpace && this.isMining == 0)
   {
      if(this.mineCount != 0)
      {
         listMines = _root.objMap.getOthers(-1,1,3,1);
         x = 0;
         while(x < listMines.length)
         {
            if(_root.bomb_container["bomb" + listMines[x]].base.hitTest(this.base) == true)
            {
               return undefined;
            }
            x++;
         }
         _root.addBomb(this._x,this._y,-1);
         _root.mine_drop.start(0,0);
         this.isMining = 3;
         if(this.mineCount != 0)
         {
            this.mineCount = this.mineCount - 1;
         }
      }
   }
   if(!_root.keys.isSpace)
   {
      if(this.isMining != 0)
      {
         this.isMining = this.isMining - 1;
      }
   }
}
function enemy1_Create()
{
   this.bulletMaxHits = 1;
   this.fireCount = 1;
   this.speedVehicle = 3;
   this.isFiring = 0;
   this.isMining = 0;
   this.isTread = 0;
   this.isDestroyed = 0;
   this.turret.dir = 1;
   this.turret._rotation = 180;
}
function enemy1_RotateTurret()
{
   if(this.turret.dir == 1)
   {
      this.turret._rotation += 1;
   }
   else
   {
      this.turret._rotation -= 1;
   }
   if(this.turret._rotation < 90 && this.turret._rotation > -90)
   {
      this.turret.dir *= -1;
   }
}
function enemy1_MoveTank()
{
}
function enemy1_CheckDeath()
{
   if(this.isDestroyed == 1)
   {
      _root.addTankExplosion(this._x,this._y);
      _root.addDeathMark(this._x,this._y);
      _root.score = _root.score + 1;
      _root.objMap.delObject(this.idNumber,1);
      this.removeMovieClip();
   }
}
function enemy1_FireBullet()
{
   var _loc3_ = undefined;
   var _loc7_ = undefined;
   var _loc6_ = undefined;
   var _loc5_ = undefined;
   var _loc12_ = undefined;
   var _loc13_ = undefined;
   var _loc4_ = undefined;
   _loc12_ = Math.floor(_root.toDegrees(Math.atan2(_root.tank_container.player._y - this._y,_root.tank_container.player._x - this._x)));
   _loc13_ = Math.floor(this.turret._rotation);
   if(_root.isBetween(_loc12_ - 2,_loc12_ + 2,_loc13_) == true)
   {
      var _loc9_ = _root.calcDistance(_root.tank_container.player._x,this._x,_root.tank_container.player._y,this._y);
      var _loc11_ = (_root.tank_container.player._x - this._x) / Math.floor(_loc9_ / 30);
      var _loc10_ = (_root.tank_container.player._y - this._y) / Math.floor(_loc9_ / 30);
      var _loc8_ = true;
      _loc7_ = 0;
      while(_loc7_ < Math.floor(_loc9_ / 30))
      {
         _loc6_ = this._x + _loc11_ * (_loc7_ + 1);
         _loc5_ = this._y + _loc10_ * (_loc7_ + 1);
         _loc4_ = _root.objMap.getAt(_loc6_,_loc5_,0);
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            if(_root.wall_container["wall" + _loc4_[_loc3_]]._currentframe != 4)
            {
               if(_root.wall_container["wall" + _loc4_[_loc3_]].hidden.hitTest(_loc6_,_loc5_,false) == true)
               {
                  _loc8_ = false;
               }
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc7_ = _loc7_ + 1;
      }
      if(_loc8_ == true && this.fireCount != 0)
      {
         _loc6_ = this._x + Math.cos(_root.toRadians(this.turret._rotation)) * 30;
         _loc5_ = this._y + Math.sin(_root.toRadians(this.turret._rotation)) * 30;
         _loc4_ = _root.objMap.getOthers(-1,1,0,1);
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            if(_root.wall_container["wall" + _loc4_[_loc3_]].hidden.hitTest(_loc6_,_loc5_,false) == true)
            {
               return undefined;
            }
            _loc3_ = _loc3_ + 1;
         }
         _root.addBullet(_loc6_,_loc5_,this.turret._rotation,this.bulletMaxHits,this.idNumber);
         _root.addMuzzleFlash(_loc6_,_loc5_);
         this.isFiring = 0;
         if(this.fireCount != 0)
         {
            this.fireCount = this.fireCount - 1;
         }
      }
   }
}
getURL("FSCommand:allowscale",false);
var mapData = new Array();
var enemyData = new Array();
var nodeData = new Array();
this.mapData[1] = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,2,1,1,1,1,1,1,0],[0,1,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,1,0],[0,1,0,0,0,0,9,0,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,1,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,9,0,9,0,0,3,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,5,0,9,0,9,0,0,3,0,0,0,0,0,0,0,0,6,0,0,1,0],[0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,9,0,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,1,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
this.mapData[2] = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,1,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,9,1,0],[0,1,0,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,1,0],[0,1,0,0,0,1,1,1,1,1,1,1,1,3,3,3,3,3,0,0,0,0,0,1,0],[0,1,0,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,1,0],[0,1,0,0,0,0,0,3,3,3,3,3,1,1,1,1,1,1,1,1,0,0,0,1,0],[0,1,0,0,0,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,1,0],[0,1,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,1,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
this.mapData[3] = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,1,1,1,3,3,3,3,3,1,0,0,0,0,5,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,6,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,1,3,3,3,3,3,1,1,1,0,0,1,0],[0,1,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,1,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
this.mapData[4] = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,1,0,0,0,0,0,0,4,0,0,0,0,0,0,0,4,0,0,0,0,0,0,1,0],[0,1,0,0,6,0,0,0,4,0,0,0,6,0,0,0,4,0,0,0,6,0,0,1,0],[0,1,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,4,4,4,4,4,0,4,0,4,4,4,4,4,4,4,4,4,4,4,4,4,1,0],[0,1,0,0,0,0,0,0,4,0,0,0,6,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,1,0],[0,1,4,4,4,4,4,4,4,4,4,4,4,4,4,0,4,0,4,4,4,4,4,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,1,0],[0,1,0,0,5,0,0,0,4,0,0,0,0,0,0,0,4,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,4,0,0,0,0,0,0,0,4,0,0,0,0,0,0,1,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
this.mapData[5] = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,3,1,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
this.mapData[6] = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,1,3,1,3,1,1,1,1,1,1,1,1,1,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,6,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,6,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,1,1,1,1,1,1,1,1,1,3,1,3,1,0,0,6,0,1,0],[0,1,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,1,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
this.enemyData[1] = [1];
this.enemyData[2] = [1,1];
this.enemyData[3] = [1,1,1];
this.enemyData[4] = [1,1,1,1];
this.enemyData[5] = [1,1];
this.enemyData[6] = [1,1,1,1];
this.nodeData[1] = [8,6,0,2,0,2,6,8,0,2,6,8,6,8,2,0];
this.nodeData[2] = [8,6,0,2,6,8,0,2,6,8,2,0];
_root.isBetween = function(Min, Max, Num)
{
   if(Num >= Min && Num <= Max)
   {
      return true;
   }
   return false;
};
_root.toRadians = function(Degrees)
{
   return Degrees * 0.017453292519943295;
};
_root.toDegrees = function(Radians)
{
   return Radians * 57.29577951308232;
};
_root.calcDistance = function(x1, x2, y1, y2)
{
   return Math.sqrt(Math.pow(x2 - x1,2) + Math.pow(y2 - y1,2));
};
_root.calcAngle = function(x1, x2, y1, y2)
{
   var _loc2_ = Math.abs(_root.toDegrees(Math.atan((x1 - x2) / (y2 - y1))));
   if(x1 > x2 && y1 > y2)
   {
      _loc2_ = 90 - _loc2_ + 90;
   }
   else if(x1 < x2 && y1 > y2)
   {
      _loc2_ += 180;
   }
   else if(x1 < x2 && y1 < y2)
   {
      _loc2_ = 90 - _loc2_ + 270;
   }
   if(_loc2_ > 180)
   {
      _loc2_ = -1 * (360 - _loc2_);
   }
   return _loc2_;
};
var currentLevel = 0;
var currentEnemies = 0;
var cellW = 32;
var cellH = 32;
var objMap = new ObjectMap(14,25,5,this.cellW,this.cellH);
var maxTreads = 100;
var maxSmokes = 100;
var maxBullets = 20;
var maxExplosions = 50;
var maxBombs = 20;
var treadCount = 0;
var smokeCount = 0;
var bulletCount = 0;
var explosionCount = 0;
var bombCount = 0;
var wallCount = 0;
var tankCount = 0;
var killCount = 0;
var bullet_shot = new Sound();
bullet_shot.attachSound("shot.mp3");
var bullet_bounce = new Sound();
bullet_bounce.attachSound("bullet_bounce.mp3");
var mine_drop = new Sound();
mine_drop.attachSound("mine_drop.mp3");
var mine_explosion = new Sound();
mine_explosion.attachSound("mine_explosion.mp3");
var bullet_explosion = new Sound();
bullet_explosion.attachSound("bullet_explosion.wav");
var treads = new Sound();
treads.attachSound("treads.wav");
var intro = new Sound();
intro.attachSound("intro.mp3");
var maxCursors = 3;
var maxTrail = 100;
var trailCount = 0;
x = 0;
while(x < this.maxCursors)
{
   _root.cursor_container.attachMovie("cursor_floater","cursor_floater" + x,_root.cursor_container.getNextHighestDepth());
   _root.cursor_container["cursor_floater" + x]._x = 0;
   _root.cursor_container["cursor_floater" + x]._y = 0;
   x++;
}
this.lockCursor = function()
{
   _root.mouse._x = _root._xmouse;
   _root.mouse._y = _root._ymouse;
   if(_root.gameOver != 1)
   {
      var _loc4_ = (_root._xmouse - _root.tank_container.player._x) / (this.maxCursors + 1);
      var _loc3_ = (_root._ymouse - _root.tank_container.player._y) / (this.maxCursors + 1);
      x = 0;
      while(x < this.maxCursors)
      {
         _root.cursor_container["cursor_floater" + x]._x = _root.tank_container.player._x + _loc4_ * (x + 1);
         _root.cursor_container["cursor_floater" + x]._y = _root.tank_container.player._y + _loc3_ * (x + 1);
         x++;
      }
   }
   else
   {
      x = 0;
      while(x < this.maxCursors)
      {
         _root.cursor_container["cursor_floater" + x]._x = -10;
         _root.cursor_container["cursor_floater" + x]._y = -10;
         x++;
      }
   }
   if(_root.cursor_container["trail" + this.trailCount] != undefined)
   {
      _root.cursor_container["trail" + this.trailCount].removeMovieClip();
   }
   _root.cursor_container.attachMovie("cursor_trail","trail" + this.trailCount,_root.cursor_container.getNextHighestDepth());
   _root.cursor_container["trail" + this.trailCount]._x = _root._xmouse;
   _root.cursor_container["trail" + this.trailCount]._y = _root._ymouse;
   _root.cursor_container["trail" + this.trailCount].lineStyle(5,65535,100);
   var _loc5_ = this.trailCount - 1;
   if(_loc5_ < 0)
   {
      _loc5_ = this.maxTrail;
   }
   _root.cursor_container["trail" + _loc5_].lineTo(_root.cursor_container["trail" + _loc5_]._xmouse,_root.cursor_container["trail" + _loc5_]._ymouse);
   this.trailCount = this.trailCount + 1;
   if(this.trailCount > this.maxTrail)
   {
      this.trailCount = 0;
   }
};
this.onEnterFrame = function()
{
   var _loc3_ = undefined;
   var _loc2_ = undefined;
   var _loc4_ = undefined;
   var _loc6_ = undefined;
   var _loc11_ = undefined;
   var _loc9_ = undefined;
   var _loc10_ = undefined;
   var _loc7_ = undefined;
   var _loc5_ = undefined;
   var _loc8_ = undefined;
   _root.lockCursor();
   _root.player_RotateTurret.call(_root.tank_container.player);
   if(_root.isPaused == 0)
   {
      _loc4_ = _root.objMap.getList(1);
      _loc6_ = _root.objMap.getList(2);
      _loc11_ = _root.objMap.getList(3);
      _loc9_ = _root.objMap.getList(4);
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         if(_loc4_[_loc3_] != -1)
         {
            _root["enemy" + _root.tank_container["tank" + _loc4_[_loc3_]].aiType + "_RotateTurret"].call(_root.tank_container["tank" + _loc4_[_loc3_]]);
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         if(_loc4_[_loc3_] == -1)
         {
            _root.player_CheckDeath.call(_root.tank_container.player);
         }
         _root["enemy" + _root.tank_container["tank" + _loc4_[_loc3_]].aiType + "_CheckDeath"].call(_root.tank_container["tank" + _loc4_[_loc3_]]);
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc6_.length)
      {
         _root.bullet_CheckDeath.call(_root.bullet_container["bullet" + _loc6_[_loc3_]]);
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc11_.length)
      {
         _root.bomb_CheckDeath.call(_root.bomb_container["bomb" + _loc11_[_loc3_]]);
         _loc3_ = _loc3_ + 1;
      }
      _loc4_ = _root.objMap.getList(1);
      _loc6_ = _root.objMap.getList(2);
      _loc11_ = _root.objMap.getList(3);
      if(_root.gameOver == 1)
      {
         _root.endGame();
         return undefined;
      }
      if(_loc4_.length == 1)
      {
         _root.endLevel();
         return undefined;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         if(_loc4_[_loc3_] == -1)
         {
            _root.player_MoveTank.call(_root.tank_container.player);
         }
         else
         {
            _root["enemy" + _root.tank_container["tank" + _loc4_[_loc3_]].aiType + "_MoveTank"].call(_root.tank_container["tank" + _loc4_[_loc3_]]);
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc6_.length)
      {
         _root.bullet_Move.call(_root.bullet_container["bullet" + _loc6_[_loc3_]]);
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         _loc10_ = _root.objMap.getOthers(_loc4_[_loc3_],1,1,1);
         _loc7_ = _root.objMap.getOthers(_loc4_[_loc3_],1,0,1);
         _loc5_ = _root.objMap.getOthers(_loc4_[_loc3_],1,2,1);
         _loc8_ = _root.objMap.getOthers(_loc4_[_loc3_],1,3,4);
         _loc2_ = 0;
         while(_loc2_ < _loc10_.length)
         {
            if(_loc4_[_loc3_] < _loc10_[_loc2_])
            {
               _root.tank_CheckTank(_loc4_[_loc3_],_loc10_[_loc2_]);
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc7_.length)
         {
            _root.tank_CheckWall(_loc4_[_loc3_],_loc7_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc5_.length)
         {
            _root.tank_CheckBullet(_loc4_[_loc3_],_loc5_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc8_.length)
         {
            _root.tank_CheckBomb(_loc4_[_loc3_],_loc8_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc6_.length)
      {
         _loc5_ = _root.objMap.getOthers(_loc6_[_loc3_],2,2,1);
         _loc7_ = _root.objMap.getOthers(_loc6_[_loc3_],2,0,1);
         _loc8_ = _root.objMap.getOthers(_loc6_[_loc3_],2,3,1);
         _loc2_ = 0;
         while(_loc2_ < _loc5_.length)
         {
            if(_loc6_[_loc3_] < _loc5_[_loc2_])
            {
               _root.bullet_CheckBullet(_loc6_[_loc3_],_loc5_[_loc2_]);
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc7_.length)
         {
            _root.bullet_CheckWall(_loc6_[_loc3_],_loc7_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc8_.length)
         {
            _root.bullet_CheckBomb(_loc6_[_loc3_],_loc8_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc9_.length)
      {
         _loc7_ = _root.objMap.getOthers(_loc9_[_loc3_],4,0,5);
         _loc10_ = _root.objMap.getOthers(_loc9_[_loc3_],4,1,5);
         _loc5_ = _root.objMap.getOthers(_loc9_[_loc3_],4,2,5);
         _loc8_ = _root.objMap.getOthers(_loc9_[_loc3_],4,3,5);
         _loc2_ = 0;
         while(_loc2_ < _loc10_.length)
         {
            _root.explosion_CheckTank(_loc9_[_loc3_],_loc10_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc5_.length)
         {
            _root.explosion_CheckBullet(_loc9_[_loc3_],_loc5_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc7_.length)
         {
            _root.explosion_CheckWall(_loc9_[_loc3_],_loc7_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc8_.length)
         {
            _root.explosion_CheckBomb(_loc9_[_loc3_],_loc8_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         if(_loc4_[_loc3_] == -1)
         {
            _root.player_FireBullet.call(_root.tank_container.player);
         }
         else
         {
            _root["enemy" + _root.tank_container["tank" + _loc4_[_loc3_]].aiType + "_FireBullet"].call(_root.tank_container["tank" + _loc4_[_loc3_]]);
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         if(_loc4_[_loc3_] == -1)
         {
            _root.player_FireMine.call(_root.tank_container.player);
         }
         else
         {
            _root["enemy" + _root.tank_container["tank" + _loc4_[_loc3_]].aiType + "_FireMine"].call(_root.tank_container["tank" + _loc4_[_loc3_]]);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
};
_root.score = 0;
_root.gameOver = 0;
_root.isPaused = 1;
_root.missionGui._alpha = 0;
_root.playerGui._alpha = 0;
stop();
