#================================
# ■ Dynamic Maps
#================================
# 　By: Near Fantastica
#   Date: 05.09.05
#   Version: 1
#================================

# updated 2005-11-07 by Wachunga
# generalized to work for modified versions of Game_Map,
# e.g. even if more instance variables are added

module Map
  #--------------------------------------------------------------
  @map_data = {}
  #--------------------------------------------------------------------------
  def Map.set_map(map, map_id)
    @map_data[map_id] = map
  end
  #--------------------------------------------------------------------------
  def Map.data(map_id)
    return @map_data[map_id]
  end
end

class Game_Map
 #--------------------------------------------------------------
  alias dm_orig_setup setup
  def setup(map_id)    save_map(@map_id)
    if Map.data(map_id) == nil
      dm_orig_setup(map_id)
    else
      load_map(map_id)
    end
  end
 #-----------------------------------------------------------
 def load_map(map_id)
   $game_map = Map.data(map_id)
 end
 #--------------------------------------------------------------
 def save_map(map_id)
   return if map_id == 0
   Map.set_map(self.dup, map_id)
 end
end
