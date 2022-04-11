package com.seimeihandan
//2022.04.10 バックアップ　ひな形アプリ
import android.app.AlertDialog
import android.app.Dialog
import android.content.Context
import android.content.DialogInterface
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.os.Bundle
import android.os.Parcel
import android.os.Parcelable
import android.os.Vibrator
import android.speech.tts.TextToSpeech
import android.speech.tts.UtteranceProgressListener
import android.support.v4.app.*
import android.util.Log
import android.view.Window
import android.view.WindowManager
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.DialogFragment
import java.util.*


class MainActivity() : AppCompatActivity(), TextToSpeech.OnInitListener, Parcelable {
    var No = 0
    var VIBRATION_ON = 1
    var mode = 0
    var flag = 0

    //  private lateinit var mediaPlayer: MediaPlayer
    //   private val myContext: Context = context
    private var textToSpeech: TextToSpeech? = null
    private val tts: TextToSpeech? = null

    constructor(parcel: Parcel) : this() {
        No = parcel.readInt()
        VIBRATION_ON = parcel.readInt()
        mode = parcel.readInt()
        flag = parcel.readInt()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        //setHasOptionsMenu(true)
        textToSpeech = TextToSpeech(this, this)
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        //val actionBar: ActionBar? = supportActionBar
        //if (actionBar != null) {
        //  actionBar.setTitle("テキスト")
        //}
        var text = getString(R.string.Ready_Message)
        //SpeechText(getString("テスト".toString()))
        // ボタンを設定
        // ボタンを設定
        var Screenview: TextView = findViewById(R.id.view_screen)

        val Button1: Button = findViewById(R.id.button_1)
        val Button2: Button = findViewById(R.id.button_2)
        val Button3: Button = findViewById(R.id.button_3)
        val Button4: Button = findViewById(R.id.button_4)
        val Button5: Button = findViewById(R.id.button_5)
        val Button6: Button = findViewById(R.id.button_6)
        val Button7: Button = findViewById(R.id.button_7)
        val Button8: Button = findViewById(R.id.button_8)
        val Button9: Button = findViewById(R.id.button_9)
        val Button0: Button = findViewById(R.id.button_0)
        val Button_Clear: Button = findViewById(R.id.button_Clear)
        val Button_EXE: Button = findViewById(R.id.button_EXE)


        Button1.setOnClickListener {
            Vibration()
            No = 1
            when (mode) {
                5 -> {
                    flag = 8
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.TopMenu_Select1, No))
                }
                4 -> {
                    flag = 4
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.Help_Select1, No))
                }
                5 -> {
                    flag = 7
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.Setting_Select1, No))

                }
                6 -> {
                    flag = 9

                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.SeimeiHandan_Select1, No))
                    //Input_moji()
                }

                // val messageView: TextView = findViewById(R.id.view_screen)
                // messageView.text = (getString(R.string.TopMenu_NoSelect))
                // String.format(R.string.TopMenu_NoSelect,No)

            }
            //Toast.makeText(this, "テストメッセージです", Toast.LENGTH_SHORT).show()
        }
        Button2.setOnClickListener {
            Vibration()
            No = 2
            when (mode) {
                5 -> {
                    flag = 6
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.TopMenu_Select2, No))
                }
                4 -> {
                    flag = 5
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.Help_Select2, No))
                }
                6 -> {
                    flag = 10

                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.SeimeiHandan_Select2, No))
                    //Input_moji()
                }
                // val messageView: TextView = findViewById(R.id.view_screen)
                // messageView.text = (getString(R.string.TopMenu_NoSelect))
                // String.format(R.string.TopMenu_NoSelect,No)

            }
            //Toast.makeText(this, "テストメッセージです", Toast.LENGTH_SHORT).show()


        }
        Button3.setOnClickListener {
            Vibration()
            No = 3
            when (mode) {
                5 -> {
                    flag = 3
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.TopMenu_Select3, No))
                }

                // val messageView: TextView = findViewById(R.id.view_screen)
                // messageView.text = (getString(R.string.TopMenu_NoSelect))
                // String.format(R.string.TopMenu_NoSelect,No)

            }
            //Toast.makeText(this, "テストメッセージです", Toast.LENGTH_SHORT).show()
        }
        Button4.setOnClickListener {
            Vibration()
            Toast.makeText(this, "テストメッセージです", Toast.LENGTH_SHORT).show()
        }
        Button5.setOnClickListener {
            Vibration()
            Toast.makeText(this, "テストメッセージです", Toast.LENGTH_SHORT).show()
        }
        Button6.setOnClickListener {
            Vibration()
            Toast.makeText(this, "テストメッセージです", Toast.LENGTH_SHORT).show()
        }
        Button7.setOnClickListener {
            Vibration()
            Toast.makeText(this, "テストメッセージです", Toast.LENGTH_SHORT).show()
        }
        Button8.setOnClickListener {
            Vibration()
            Toast.makeText(this, "テストメッセージです", Toast.LENGTH_SHORT).show()
        }

        Button9.setOnClickListener {
            Vibration()
            Toast.makeText(this, "テストメッセージです", Toast.LENGTH_SHORT).show()
        }
        Button_Clear.setOnClickListener {
            Vibration()
            flag = 0
            mode = 0
            No = 0
            val messageView: TextView = findViewById(R.id.view_screen)
            messageView.text = (getString(R.string.TopMessage))

            Toast.makeText(this, R.string.AllClearMessage, Toast.LENGTH_SHORT).show()
        }
        Button_EXE.setOnClickListener {
            Vibration()
            No = 0
            /*トップ画面
                          select3 Helpのコンテンツ Version Dialog
                        */
            when (flag) {
                0 -> {
                    SpeechText("準備できました")
                    mode = 5
                    val Screenview: TextView = findViewById(R.id.view_screen)
                    // Screenview.setTextSize(8.0f)
                    Screenview.text = (getString(R.string.TopMenu_NoSelect, No))
                }
                1 -> {
                    /*トップ画面
                       select1 トップ画面のコンテンツ
                     */
                    mode = 2
                    val messageView: TextView = findViewById(R.id.view_screen)
                    //messageView.setTextSize(48.0f)
                    //messageView.setTextSize(32.0f)
                    messageView.text = (getString(R.string.TopMenu_NoSelect, No))

                }
                2 -> {
                    /*トップ画面
                       select2 設定のコンテンツ
                     */
                    mode = 3
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.TopMenu_NoSelect, No))

                }
                3 -> {
                    /*トップ画面
                       select3 Helpのコンテンツ
                     */
                    mode = 4
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.Help_NoSelect, No))

                }
                4 -> {
                     VersionDialog()
                }
                5 -> {
                     ReferenceBookDialog()
                }
                6 -> {
                    /*設定　トップ画面*/
                    mode = 5
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.Setting_NoSelect, No))


                }
                7 -> {
                    //バイブの設定　ダイアログ

                }
                8 -> {
                    mode = 6

                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.SeimeiHandan_NoSelect,No))
                     //  Input_moji()
                    //alertDialogDemo()
                }
                9->{
                    Input_moji()
                }
                // val messageView: TextView = findViewById(R.id.view_screen)
                // messageView.text = (getString(R.string.TopMenu_NoSelect))
                // String.format(R.string.TopMenu_NoSelect,No)

            }
            //Toast.makeText(this, "テストメッセージです", Toast.LENGTH_SHORT).show()
        }
        Button0.setOnClickListener {
            Vibration()
            Toast.makeText(this, "テストメッセージです", Toast.LENGTH_SHORT).show()
        }


    }


    //verride fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
    // inflater.inflate(R.menu.sample_menu, menu)
    //}

    private fun Vibration() {
        val vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        vibrator.vibrate(200) // 200 ms
    }

    override fun onDestroy() {
        textToSpeech?.shutdown()
        super.onDestroy()
    }

    override fun onStop() {
        super.onStop()
        val vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        vibrator.cancel()
    }

    /*mp3 再生*/
    /*
    fun playsound(BGM file)
    {
        mediaPlayer = MediaPlayer.create(this, file)
        mediaPlayer.isLooping = true
        mediaPlayer.start()
    }
    */
    /*
    fun stopMusic() {
        mediaPlayer.stop()
        mediaPlayer.reset()
        mediaPlayer.release()
    }

     */
    /*
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onClick(v: View?) {
        TODO("Not yet implemented")
        //  var text = TextToSpeech.toString()

        //   SpeechText(text)
    }

     */
    override fun onResume() {
        super.onResume()
        //setVolumeControlStream(AudioManager.STREAM_MUSIC)
        // var text = "テスト".text.toString()
    }

    override fun onInit(status: Int) {
        if (status == TextToSpeech.SUCCESS) {
            Log.d("tts", "TextToSpeech初期化成功")
            // var text = getString(R.string.Ready_Message)
            // SpeechText(text)
            val listener = object : UtteranceProgressListener() {
                var tag: String = "TTS"
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
            tts?.setOnUtteranceProgressListener(listener)
        } else {
            Log.d("tts", "TextToSpeech初期化失敗")
        }
    }

    fun customDialog() {
        // customDialogFragmentを呼ぶ
        val dialog = CustomDialog()
        dialog.show(supportFragmentManager, "custom_dialog")
    }

    private fun SpeechText(text: String) {
        tts?.setLanguage(Locale.JAPANESE)
        tts?.speak(text, TextToSpeech.QUEUE_FLUSH, null, "ID")
    }

    /*
    private fun SpeechText(text:String){
        tts?.setLanguage(Locale.JAPANESE)
        tts?.speak(text,TextToSpeech.QUEUE_FLUSH,null,"ID")
    }
*/
    private fun startSpeak(text: String, isImmediately: Boolean) {
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
            textToSpeech?.speak(text, TextToSpeech.QUEUE_FLUSH, null, "utteranceId")
        }
    }

    override fun writeToParcel(parcel: Parcel, flags: Int) {
        parcel.writeInt(No)
        parcel.writeInt(VIBRATION_ON)
        parcel.writeInt(mode)
        parcel.writeInt(flag)
    }

    override fun describeContents(): Int {
        return 0
    }

    companion object CREATOR : Parcelable.Creator<MainActivity> {
        override fun createFromParcel(parcel: Parcel): MainActivity {
            return MainActivity(parcel)
        }

        override fun newArray(size: Int): Array<MainActivity?> {
            return arrayOfNulls(size)
        }
    }


    //Edit Dialog
    private fun Input_moji() {
        customDialog()
    }


    //
//
//
// //参考文献
    fun ReferenceBookDialog() {
        AlertDialog.Builder(this)
            .setTitle(R.string.ReferenceBookTitle)
            .setMessage(R.string.ReferenceBookSentense)
            .setPositiveButton(R.string.Ok) { dialog, which -> }
            .show()
//
//
//return builder.create()
    }

    //
    fun  VersionDialog(){
        AlertDialog.Builder(this)
            .setTitle(R.string.VersionTitle)
            .setMessage(R.string.VersionSentense)
            .setPositiveButton(R.string.Ok) { dialog, which -> }
            .show()
    }
// //設定　バイブのオンオフ 
    fun Setting_Vibration() {

        val strList = arrayOf(
            getString(R.string.Setting_Vibration_List1), getString(R.string.Setting_Vibration_List2)
        )

        AlertDialog.Builder(this) // FragmentではActivityを取得して生成
            .setTitle(R.string.Setting_Vibration_Title)
            .setSingleChoiceItems(strList, 0) { dialog_, _ ->
                // TODO:アイテム選択時の挙動
            }
            .setPositiveButton(getString(R.string.Ok)) { dialog, which ->
            }
            .show()


    }
}







