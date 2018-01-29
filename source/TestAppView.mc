using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class TestAppView extends Ui.View {
	private var mTestAppModel;
	
    function initialize(testAppModel) {
        View.initialize();
        me.mTestAppModel = testAppModel;
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }
	
	private const StartDegree = 90;
	
    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        
        var endDegree1 = StartDegree + me.percentageToArcDegree(me.mTestAppModel.drawPercentage);
        var mainWidth = dc.getWidth() / 5;
        var radius1 = dc.getHeight() / 2;
        drawDuration(dc, Gfx.COLOR_GREEN, mainWidth, radius1, StartDegree, endDegree1);
        
        var endDegree2 = me.percentageToArcDegree(1) + endDegree1;
        drawDuration(dc, Gfx.COLOR_BLUE, mainWidth, radius1, endDegree1, endDegree2);
        
        var endDegree3 = me.percentageToArcDegree(10) + endDegree2;
        drawDuration(dc, Gfx.COLOR_RED, mainWidth, radius1, endDegree2, endDegree3);
                
        var intermediateWidth = dc.getWidth() / 25;
        var intermediateOffset = radius1 - mainWidth / 2 - intermediateWidth / 2;
        var colors = [Gfx.COLOR_YELLOW, Gfx.COLOR_PINK, Gfx.COLOR_DK_BLUE, Gfx.COLOR_RED, Gfx.COLOR_DK_GREEN];
        for (var i = 0; i < colors.size(); i++) {
        	drawDuration(dc, colors[i], intermediateWidth, intermediateOffset - i * intermediateWidth, StartDegree, endDegree3);  
        }      
    }
    
    private function drawDuration(dc, color, width, radius, startDegree, endDegree) {
        dc.setColor(color, Gfx.COLOR_TRANSPARENT);
        dc.setPenWidth(width);
        dc.drawArc(dc.getWidth() / 2, dc.getHeight() / 2,  radius , Gfx.ARC_CLOCKWISE, startDegree, endDegree);
    }
    
    private function percentageToArcDegree(percentage) {
    	return - percentage * 3.6;
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
