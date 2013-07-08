/**
 * Created with IntelliJ IDEA.
 * User: Fricken Hamster
 * Date: 6/25/13
 * Time: 3:04 PM
 *
 */
package
{
import flash.display.MovieClip;

public class GenTest extends MovieClip
{
	public function GenTest()
	{
		var gen:OceanGenerator = new OceanGenerator(34241);
		addChild(gen);
		gen.y  = 100;
	}
}
}
