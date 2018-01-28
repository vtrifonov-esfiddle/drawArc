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
        
        dc.setColor(Gfx.COLOR_GREEN, Gfx.COLOR_TRANSPARENT);
        var endDegree1 = StartDegree + me.percentageToArcDegree(me.mTestAppModel.drawPercentage);
        var arcWidth = dc.getWidth() / 5;
        dc.setPenWidth(arcWidth);
        dc.drawArc(dc.getWidth() / 2, dc.getHeight() / 2, dc.getHeight() / 2, Gfx.ARC_CLOCKWISE, StartDegree, endDegree1);
        
        dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
        var endDegree2 = me.percentageToArcDegree(67) + endDegree1;
        dc.drawArc(dc.getWidth() / 2, dc.getHeight() / 2, dc.getHeight() / 2, Gfx.ARC_CLOCKWISE, endDegree1, endDegree2);
        
        dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
        var arcWidth2 = arcWidth / 2;
        dc.setPenWidth(arcWidth2);
        dc.drawArc(dc.getWidth() / 2, dc.getHeight() / 2, dc.getHeight() / 2 - arcWidth + arcWidth2 / 2, Gfx.ARC_CLOCKWISE, 90, endDegree1);
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
