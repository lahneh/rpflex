package com.loning.image.faceprocesses.facedistorts
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import com.loning.image.filters.Magnify;
	import de.popforge.imageprocessing.filters.NativeFilter;
	
	public class SwellingFaceDistort implements IFaceProcessor
	{
		public function SwellingFaceDistort()
		{
		}
		
		public function Process(lm:LayerManager, face:Face):void
		{
		}
		
		public function OnProcessing(lm:LayerManager, face:Face, queue:FilterQueue):void
		{
		}
		
		public function OnProcessed(lm:LayerManager, face:Face, queue:FilterQueue):void
		{
			//肿脸
			
			var filter:NativeFilter;
			var rRate:Number=1.5;
			var dx:Number=face.FaceRectangle.width/3;
			var y:Number=face.FaceRectangle.height/2;
			filter=new Magnify(
				face.Center.x - dx,
				face.FaceRectangle.y+y,
				0,
				face.Radius*rRate);
			queue.addFilter(filter);
			
			filter=new Magnify(
				face.Center.x + dx,
				face.FaceRectangle.y+y,
				0,
				face.Radius*rRate);
			queue.addFilter(filter);
		}
		
		public function RpDescription(face:Face):String
		{
			return "肿肿脸";
		}
	}
}