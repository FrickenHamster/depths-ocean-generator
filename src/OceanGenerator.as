/**
 * Created with IntelliJ IDEA.
 * User: Fricken Hamster
 * Date: 6/25/13
 * Time: 2:40 PM
 *
 */
package
{
import flash.display.Sprite;

public class OceanGenerator extends Sprite
{
	
	private var rand:HamRandom;
	
	public function OceanGenerator(seed:int)
	{
		rand = new HamRandom(seed);
		
		generateHeightMap(200);
	}
	
	public var heightMap:Vector.<int>;
	public const deepConst:int = 200;
	public const seedInterval:int = 8;
	public const initalRange:int = 6;
	public const hConst:Number = .9;
	
	public function generateHeightMap(ww:int):void
	{
		heightMap = new Vector.<int>(ww);
		
		//start diamond square 1d
		//seed values
		for (var i:int = 0; i < ww; i += seedInterval)
		{
			var dsl:int = Math.sqrt(i * deepConst);
			heightMap[i] = rand.nextIntRange(dsl - initalRange, dsl + initalRange);
		}
		if (heightMap[heightMap.length - 1] == 0)
		{
			dsl = Math.sqrt((heightMap.length - 1) * deepConst);
			heightMap[heightMap.length - 1] = rand.nextIntRange(dsl - initalRange, dsl + initalRange);
		}
		
		
		var curinterval:int = seedInterval / 2;
		var curRange:int = initalRange;
		while (curinterval >= 1)
		{
			for (i = 0; i <ww; i+= curinterval)
			{
				if (heightMap[i] != 0)
					continue;
				dsl = (heightMap[i - curinterval] + heightMap[Math.min(heightMap.length - 1, i + curinterval)]) / 2;
				heightMap[i] = rand.nextIntRange(dsl - curRange, dsl + curRange);
			}
			curinterval *= .5;
			curRange *= Math.pow(2, -hConst);
		}
		
		
		graphics.lineStyle(1, 0x000000);
		graphics.moveTo(0, heightMap[0]);
		for (i = 0; i < ww; i++)
		{
			graphics.lineTo(i * 5, heightMap[i]);
		}
		
	}
}
}
