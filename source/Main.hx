import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.utils.ByteArray;
import openfl.Assets;
import openfl.text.Font;
import Type;


class Main extends Sprite {

    private var _inputField:TextField;
    private var _outputField:TextField;

    public function new() {
        super();
        init();
    }

    private function init():Void {

        // Create output text field
        _outputField = new TextField();
        _outputField.defaultTextFormat = new TextFormat("Courier New", 30, 0xFFFFFF);
        _outputField.width = stage.stageWidth;
        _outputField.height = stage.stageHeight - 20;
        _outputField.multiline = true;
        _outputField.wordWrap = true;
        _outputField.text = "Actbit\n\n> ";
        addChild(_outputField);

        // Create input text field
        _inputField = new TextField();
        _inputField.defaultTextFormat = new TextFormat("Courier New", 30, 0xFFFFFF);
        _inputField.width = stage.stageWidth;
        _inputField.height = 20;
        _inputField.type = TextFieldType.INPUT;
        _inputField.addEventListener(KeyboardEvent.KEY_DOWN, onInputKeyDown);
        addChild(_inputField);

        stage.focus = _inputField;
    }

    private function onInputKeyDown(event:KeyboardEvent):Void {
        if (event.keyCode == 13) { // Enter key pressed
            var input:String = _inputField.text;
            _outputField.appendText("\n" + input);
            _inputField.text = "";
            _outputField.appendText("\n> ");
        }
    }

}
