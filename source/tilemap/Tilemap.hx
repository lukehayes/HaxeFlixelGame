package tilemap;

import sys.io.File;
import openfl.utils.Assets;

/**
  Load and parse a Tiled tilemap from a JSON file.
  */
class Tilemap
{
    // Parsed JSON file
    private var mapData : String;

    public function new(jsonFile : String)
    {
        // Load the JSON file into mapData
        this.mapData = Assets.getText('assets/data/${jsonFile}');
    }
}
