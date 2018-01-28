using Toybox.WatchUi as Ui;

class TestAppDelegate extends Ui.BehaviorDelegate {
	private var mTestAppModel;

    function initialize(testAppModel) {
        BehaviorDelegate.initialize();
        me.mTestAppModel = testAppModel;
    }
        
    function onSelect() {
    	me.mTestAppModel.drawPercentage++;
    	System.println("drawPercentage: " + me.mTestAppModel.drawPercentage);
    	Ui.requestUpdate();
    }

}