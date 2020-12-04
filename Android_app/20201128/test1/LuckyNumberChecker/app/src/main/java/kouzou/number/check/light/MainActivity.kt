package kouzou.number.check.light
import android.content.Context
import android.os.*
import android.os.VibrationEffect.DEFAULT_AMPLITUDE
import android.speech.tts.TextToSpeech
import android.speech.tts.UtteranceProgressListener
import android.util.Log
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity

import java.util.*
import android.os.Vibrator as Vibrator1



class  MainActivity: AppCompatActivity(),View.OnClickListener,TextToSpeech.OnInitListener,
    Parcelable {
    private var textToSpeech: TextToSpeech? = null
    //初期化変数
    private var mode: Int = 0
    private var flag: Int = 0
    private var No=0
    private var Count=0
    private var buffer_Number=0
    val NUM_MAX = 200

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        //  var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        //val pattern = longArrayOf(3000, 1000, 2000, 5000, 3000, 1000) // OFF/ON/OFF/ON...
        // TextToSpeech初期化
        startSpeak("準備できました ",true)

        val screenView: TextView = findViewById(R.id.view_screen)
        textToSpeech = TextToSpeech(this, this)
        val button1: Button = findViewById(R.id.one_button)
        val button2: Button = findViewById(R.id.two_button)
        val button3: Button = findViewById(R.id.three_button)
        val button4: Button = findViewById(R.id.four_button)
        val button5: Button = findViewById(R.id.five_button)
        val button6: Button = findViewById(R.id.six_button)
        val button7: Button = findViewById(R.id.seven_button)
        val button8: Button = findViewById(R.id.eight_button)
        val button9: Button = findViewById(R.id.nine_button)
        val button0: Button = findViewById(R.id.zero_button)
        val button_Clear: Button = findViewById(R.id.clear_button)
        val button_EXE: Button = findViewById(R.id.exe_button)

        button1.setOnClickListener(clickListener1)
        button2.setOnClickListener(clickListener2)
        button3.setOnClickListener(clickListener3)
        button4.setOnClickListener(clickListener4)
        button5.setOnClickListener(clickListener5)
        button6.setOnClickListener(clickListener6)
        button7.setOnClickListener(clickListener7)
        button8.setOnClickListener(clickListener8)
        button9.setOnClickListener(clickListener9)
        button0.setOnClickListener(clickListener0)
        button_Clear.setOnClickListener(clickListener_Clear)
        button_EXE.setOnClickListener(clickListener_EXE)
    }
   // private var vibrator: Vibrator1? = null
   // private var vibrator: Vibrator1? = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
   //var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
  //  val pattern = longArrayOf(3000, 1000, 2000, 5000, 3000, 1000) // OFF/ON/OFF/ON...

    private val clickListener1 : View.OnClickListener = View.OnClickListener {
         No=1
        var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val vibrationEffect = VibrationEffect.createOneShot(300, DEFAULT_AMPLITUDE)
            vibrator.vibrate(vibrationEffect)
        }
        val messageView :TextView = findViewById(R.id.view_screen)
        when(flag) {
            1 -> {
                //メイン画面　選択肢１
                messageView.text = (getString(R.string.Main_Screen_Select1, No))
                mode = 1
            }
            2->{
                messageView.text = (getString(R.string.Main_Screen1_Select1, No))
                mode = 2
            }
            3->{
                mode=2
                when(Count % 4){
                    0 -> {
                    Count++;
                        buffer_Number = 0
                        buffer_Number += No
                    messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                  }
                    1 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    2 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    3 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                }

            }
            4->{
                mode = 6
                messageView.text = (getString(R.string.Help_Menu_Top_Select1,No))
            }
        }
        Toast.makeText(applicationContext, "ボタン1が押されました", Toast.LENGTH_SHORT).show();
    }
    private val clickListener2 : View.OnClickListener = View.OnClickListener {
        No=2
        var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val vibrationEffect = VibrationEffect.createOneShot(300, DEFAULT_AMPLITUDE)
            vibrator.vibrate(vibrationEffect)
        }
        val messageView :TextView = findViewById(R.id.view_screen)
        when(flag) {

            1 -> {
                //メイン画面　選択肢２
                messageView.text = (getString(R.string.Main_Screen_Select2, No))
                mode = 1
            }
            2->{
                messageView.text = (getString(R.string.Main_Screen1_Select2, No))
                mode = 3
            }
            3-> {
                mode=2
                when (Count % 4) {
                    0 -> {
                        Count++;
                        buffer_Number = 0
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    1 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    2 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    3 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                }
             }
            4->{
                mode = 4
                //Help  選択肢2 参考文献
                messageView.text = (getString(R.string.Help_Menu_Top_Select2,No))
            }

            }
        Toast.makeText(applicationContext, "ボタン2が押されました", Toast.LENGTH_SHORT).show();
    }
    private val clickListener3 : View.OnClickListener = View.OnClickListener {
        No=3
        var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val vibrationEffect = VibrationEffect.createOneShot(300, DEFAULT_AMPLITUDE)
            vibrator.vibrate(vibrationEffect)
        }
        val messageView :TextView = findViewById(R.id.view_screen)
        when(flag) {
            1 -> {
                //メイン画面　選択肢3
                mode = 3
                messageView.text = (getString(R.string.Main_Screen_Select3, No))

            }
            3-> {
                mode=2
                when (Count % 4) {
                    0 -> {
                        Count++;
                        buffer_Number = 0
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    1 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen,buffer_Number))
                    }
                    2 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    3 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                }
            }

            }
        Toast.makeText(applicationContext, "ボタン3が押されました", Toast.LENGTH_SHORT).show();
    }
    private val clickListener4 : View.OnClickListener = View.OnClickListener {
        No = 4
        var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val vibrationEffect = VibrationEffect.createOneShot(300, DEFAULT_AMPLITUDE)
            vibrator.vibrate(vibrationEffect)
        }
        val messageView :TextView = findViewById(R.id.view_screen)
        when (flag) {

            3 -> {
                mode=2
                when (Count % 4) {
                    0 -> {
                        Count++;
                        buffer_Number = 0
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    1 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    2 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen,buffer_Number))
                    }
                    3 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                }
            }
        }

        Toast.makeText(applicationContext, "ボタン4が押されました", Toast.LENGTH_SHORT).show();
    }
    private val clickListener5 : View.OnClickListener = View.OnClickListener {
        No=5
        var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val vibrationEffect = VibrationEffect.createOneShot(300, DEFAULT_AMPLITUDE)
            vibrator.vibrate(vibrationEffect)
        }
        val messageView :TextView = findViewById(R.id.view_screen)
        when (flag) {

            3 -> {
                mode=2
                when (Count % 4) {
                    0 -> {
                        Count++;
                        buffer_Number = 0
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    1 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen,buffer_Number))
                    }
                    2 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    3 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                }
            }
        }
        Toast.makeText(applicationContext, "ボタン5が押されました", Toast.LENGTH_SHORT).show();
    }
    private val clickListener6 : View.OnClickListener = View.OnClickListener {
        No=6
        var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val vibrationEffect = VibrationEffect.createOneShot(300, DEFAULT_AMPLITUDE)
            vibrator.vibrate(vibrationEffect)
        }
        val messageView :TextView = findViewById(R.id.view_screen)
        when (flag) {

            3 -> {
                mode=2
                when (Count % 4) {
                    0 -> {
                        Count++;
                        buffer_Number = 0
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    1 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    2 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    3 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                }
            }
        }
        Toast.makeText(applicationContext, "ボタン6が押されました", Toast.LENGTH_SHORT).show();
    }
    private val clickListener7 : View.OnClickListener = View.OnClickListener {
        var No=7
        var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val vibrationEffect = VibrationEffect.createOneShot(300, DEFAULT_AMPLITUDE)
            vibrator.vibrate(vibrationEffect)
        }
        val messageView :TextView = findViewById(R.id.view_screen)
        when (flag) {

            3 -> {
                mode=2
                when (Count % 4) {
                    0 -> {
                        Count++;
                        buffer_Number = 0
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    1 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    2 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    3 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                }
            }
        }
        Toast.makeText(applicationContext, "ボタン7が押されました", Toast.LENGTH_SHORT).show();
    }
    private val clickListener8 : View.OnClickListener = View.OnClickListener {
        No=8
        var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val vibrationEffect = VibrationEffect.createOneShot(300, DEFAULT_AMPLITUDE)
            vibrator.vibrate(vibrationEffect)
        }
        val messageView :TextView = findViewById(R.id.view_screen)
        when (flag) {

            3 -> {
                mode=2
                when (Count % 4) {
                    0 -> {
                        Count++;
                        buffer_Number = 0
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    1 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    2 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    3 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                }
            }
        }
        Toast.makeText(applicationContext, "ボタン8が押されました", Toast.LENGTH_SHORT).show();
    }
    private val clickListener9 : View.OnClickListener = View.OnClickListener {
        No=9
        var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val vibrationEffect = VibrationEffect.createOneShot(300, DEFAULT_AMPLITUDE)
            vibrator.vibrate(vibrationEffect)
        }
        val messageView :TextView = findViewById(R.id.view_screen)
        when (flag) {

            3 -> {
                mode=2
                when (Count % 4) {
                    0 -> {
                        Count++;
                        buffer_Number = 0
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    1 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen,buffer_Number))
                    }
                    2 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    3 -> {
                        Count++;
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen,buffer_Number))
                    }
                }
            }
        }
        Toast.makeText(applicationContext, "ボタン9が押されました", Toast.LENGTH_SHORT).show();
    }
    private val clickListener_Clear : View.OnClickListener = View.OnClickListener {
        mode=0
        flag=0
        No=0
        Count=0
        buffer_Number=0
        var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val vibrationEffect = VibrationEffect.createOneShot(300, DEFAULT_AMPLITUDE)
            vibrator.vibrate(vibrationEffect)
        }
        val messageView :TextView = findViewById(R.id.view_screen)
        messageView.text = (getString(R.string.TopScreen))
        Toast.makeText(applicationContext, "Clearが押されました", Toast.LENGTH_SHORT).show();
    }

    private fun startSpeak(text: String, isImmediately: Boolean){
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
            textToSpeech?.speak(text, TextToSpeech.QUEUE_FLUSH, null, "utteranceId")
        }
    }
    private val clickListener0 : View.OnClickListener = View.OnClickListener {
          No=0
        Toast.makeText(applicationContext, "ボタン0が押されました", Toast.LENGTH_SHORT).show();
        var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
       // val pattern = longArrayOf(1000, 2000, 5000) // OFF/ON/OFF/ON...
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val vibrationEffect = VibrationEffect.createOneShot(300, DEFAULT_AMPLITUDE)
            vibrator.vibrate(vibrationEffect)
            }
        val messageView :TextView = findViewById(R.id.view_screen)
        when (flag) {

            3 -> {
                mode=2
                when (Count % 4) {
                    0 -> {
                        Count++
                        buffer_Number = 0
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    1 -> {
                        Count++
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    2 -> {
                        Count++
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                    3 -> {
                        Count++
                        buffer_Number*=10
                        buffer_Number+=No
                        messageView.text = (getString(R.string.Input_Number_Screen, buffer_Number))
                    }
                }
            }
        }
    }
    private val clickListener_EXE : View.OnClickListener = View.OnClickListener {
        No=0
        var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val vibrationEffect = VibrationEffect.createOneShot(300, DEFAULT_AMPLITUDE)
            vibrator.vibrate(vibrationEffect)
        }
        val messageView :TextView = findViewById(R.id.view_screen)
        when(mode) {
            0 -> {
                //メイン画面　無選択
                messageView.text = (getString(R.string.Main_Screen_NoSelect, No))
                flag = 1
            }
            1->{
                //姓名判断トップ画面　無選択
                Count=0
                flag = 3
                messageView.text = (getString(R.string.Input_Number_Screen, Count))

                //messageView.text=getString(R.string.Main_Screen1_NoSelect,No)
                //flag = 2
            }
            2->{
                //1.範囲内の時
                if (buffer_Number < NUM_MAX + 1) {
                    val nameList = resources.getStringArray(R.array.Check_Number_Kikkyo)
                    messageView.text = (getString(R.string.Result_Kikkyo_Screen,
                        buffer_Number,
                        nameList[buffer_Number]))
                }
                //2.範囲外の時
                else
                {
                    messageView.text = (getString(R.string.Result_Kikkyo_Screen_else,
                        buffer_Number))
                }

            }
            3->{ //1-3 Help 選択画面
                flag = 4
                messageView.text = (getString(R.string.Help_Menu_Top_NoSelect,No))
            }
            4->{
                //1-3-2 Help　　選択画面 2.参考文献
                mode = 4
                flag = 5
                messageView.text = (getString(R.string.PushClearButtonMessage))
                Reference()
            }
            6->{
                mode = 6
                flag = 5
                messageView.text = (getString(R.string.PushClearButtonMessage))
                Version()
            }


        }
       // val textView: String =


        /*
        var vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        val pattern = longArrayOf(3000) // OFF/ON/OFF/ON...
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            vibrator?.vibrate(VibrationEffect.createWaveform(pattern, -1))
        } else {
            vibrator?.vibrate(pattern, -1)
        }


        val intent = Intent(application, SubActivity::class.java)
        startActivity(intent)
        */

    }




    override fun onResume()
    {
        super.onResume()

     /*
        vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator1
        val pattern = longArrayOf(3000, 1000, 2000, 5000, 3000, 1000) // OFF/ON/OFF/ON...

        timer(initialDelay = 60000, period = 60000) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                vibrator!!.vibrate(VibrationEffect.createWaveform(pattern, -1))
             }
        }

      */
    }

    //Menu

    //メニュー表示の為の関数
    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        super.onCreateOptionsMenu(menu)
        val inflater = menuInflater
        //メニューのリソース選択
        inflater.inflate(R.menu.main_menu, menu)
        return true
    }

    //メニューのアイテムを押下した時の処理の関数
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.getItemId()) {
            //作成ボタンを押したとき
            R.id.create -> {
                Version()
                return true
            }
            //削除ボタンを押したとき
            R.id.Reference -> {
                Reference()
                return true
            }
            else -> return super.onOptionsItemSelected(item)
        }
    }
    //メニューダイアログ
    //1.バージョン
    private fun Version() {
        // TextViewがタップされたときにダイアログを表示
       // showAlertDialogTextView.setOnClickListener {
            // BuilderからAlertDialogを作成
            val dialog = AlertDialog.Builder(this)
                .setTitle(R.string.title) // タイトル
                .setMessage(R.string.message) // メッセージ
                .setPositiveButton(R.string.ok) { dialog, which -> // OK
          //         Toast.makeText(context, "OKがタップされた", Toast.LENGTH_SHORT).show()
                }
                .create()
            // AlertDialogを表示
            dialog.show()
     //   }
    }
    //1.バージョン
    private fun Reference() {
        // TextViewがタップされたときにダイアログを表示
        // showAlertDialogTextView.setOnClickListener {
        // BuilderからAlertDialogを作成
        val dialog = AlertDialog.Builder(this)
            .setTitle(R.string.Reference_Title) // タイトル
            .setMessage(R.string.Reference) // メッセージ
            .setPositiveButton(R.string.ok) { dialog, which -> // OK
                //         Toast.makeText(context, "OKがタップされた", Toast.LENGTH_SHORT).show()
            }
            .create()
        // AlertDialogを表示
        dialog.show()
        //   }
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onClick(v: View?) {
        TODO("Not yet implemented")
      //  var text = TextToSpeech.toString()

       //   SpeechText(text)
    }

    override fun onInit(status: Int) {
        if(status == TextToSpeech.SUCCESS){
            Log.d("tts", "TextToSpeech初期化成功")

            val listener = object : UtteranceProgressListener(){
                var tag : String = "TTS"
                override fun onDone(utteranceId: String?) {
                    Log.d(tag, "音声再生が完了しました。")
                }
                override fun onError(utteranceId: String?) {
                    Log.d(tag, "音声再生中にエラーが発生しました。")
                }
                override fun onError(utteranceId: String?, errorCode: Int) {
                    Log.d(tag, "音声再生中にエラーが発生しました。")
                }
                override fun onStart(utteranceId: String?) {
                    Log.d(tag, "音声再生を開始します。")
                }
                override fun onStop(utteranceId: String?, interrupted: Boolean) {
                    Log.d(tag, "音声再生を中止します。")
                }
                override fun onBeginSynthesis(
                    utteranceId: String?,
                    sampleRateInHz: Int,
                    audioFormat: Int,
                    channelCount: Int
                ) {
                    Log.d(tag, "音声の合成を開始します。")
                }
                override fun onAudioAvailable(utteranceId: String?, audio: ByteArray?) {
                    Log.d(tag, "音声が利用可能になりました。")
                }
            }
            // イベントリスナを登録
            textToSpeech?.setOnUtteranceProgressListener(listener)
        }else{
            Log.d("tts", "TextToSpeech初期化失敗")
        }
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun SpeechText(text: String){
        textToSpeech?.setLanguage(Locale.JAPANESE)
        textToSpeech?.speak(text, TextToSpeech.QUEUE_FLUSH, null, "ID")
    }
    private fun subScreen()
    {
       // val intent = Intent(application,SubActivity::class.java)
      //  startActivity(intent)
    }
    private fun Total_Kikkyo()
    {
        //総数で吉凶を判定
        //val intent2 = Intent(this,SubActivity2::class.java)
      //  startActivity(intent2)
    }

    override fun writeToParcel(parcel: Parcel, flags: Int) {
        parcel.writeInt(mode)
        parcel.writeInt(flag)
        parcel.writeInt(No)
    }

    override fun describeContents(): Int {
        return 0
    }

    companion object CREATOR : Parcelable.Creator<MainActivity> {
        override fun createFromParcel(parcel: Parcel): MainActivity {
            return MainActivity()
        }

        override fun newArray(size: Int): Array<MainActivity?> {
            return arrayOfNulls(size)
        }

        //定数
        const val NUM = 200
    }


}










