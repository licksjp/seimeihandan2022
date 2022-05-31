package com.seimeihandan
//2022.04.10 バックアップ　姓名判断
import android.annotation.SuppressLint
import android.app.AlertDialog
import android.content.Context
import android.os.*
import android.speech.tts.TextToSpeech
import android.speech.tts.UtteranceProgressListener
import android.text.Editable
import android.text.TextWatcher
import android.util.Log
import android.view.LayoutInflater
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.annotation.RequiresApi

import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatEditText
import androidx.core.content.ContentProviderCompat.requireContext
import java.util.*
import java.util.Collections.list
import java.util.*

class MainActivity() : AppCompatActivity(), TextToSpeech.OnInitListener, Parcelable {
    var No = 0
    var VIBRATION_ON = 1
    var mode = 0
    var flag = 0
    var moji_male: String? = null
    var moji2_male: String? = null
    var moji_female: String? = null
    var moji2_female: String? = null
    var name1_male: String? = null
    var name2_female: String? = null
    //var mojiText = null
    var chiun = 0
    var buf_chiun=0
    var gaiun = 0
    var buffer_chiun = 0
    var buffer_gaiun = 0
    var buf_gaiun=0
    var buf_gaiun2=0
    var buf_gaiun3=0
    val editText = null
    val editText2 = null
    val editText3 = null
    val editText4 = null
    // val dialogLayout = null
    // val editText = null
    // val dialogLayout = LayoutInflater.from(this).inflate(R.layout.input_name_male, null)
    // val editText = dialogLayout.findViewById<AppCompatEditText>(R.id.editTextDialog)
    // val dialogLayout2 = LayoutInflater.from(this).inflate(R.layout.input_name2_male, null)
    // val editText2 = dialogLayout2.findViewById<AppCompatEditText>(R.id.editTextDialog)
    // val dialogLayout3 = LayoutInflater.from(this).inflate(R.layout.input_name_female, null)
    // val editText3 = dialogLayout3.findViewById<AppCompatEditText>(R.id.editTextDialog)
    // val dialogLayout4 = LayoutInflater.from(this).inflate(R.layout.input_name2_female, null)
    // val editText4 = dialogLayout4.findViewById<AppCompatEditText>(R.id.editTextDialog)

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

    @RequiresApi(Build.VERSION_CODES.M)
    override fun onCreate(savedInstanceState: Bundle?) {
        //setHasOptionsMenu(true)
        textToSpeech = TextToSpeech(this, this)
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        //val actionBar: ActionBar? = supportActionBar
        //if (actionBar != null) {
        //  actionBar.setTitle("テキスト")
        //}
       // var text = getString(R.string.Ready_Message)
        //SpeechText(getString("テスト".toString()))
        // ボタンを設定
        // ボタンを設定
       // var Screenview: TextView = findViewById(R.id.view_screen)

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
                9 -> {
                    flag = 7
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.Setting_Select1, No))

                }
                6 -> {
                    flag = 10

                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.SeimeiHandan_Select1, No))
                    //Input_moji()
                }
                10 -> {
                    /*設定　トップ画面*/
                    mode = 5
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.Setting_Select1, No))


                }
                11 -> {

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
                    flag = 11

                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.SeimeiHandan_Select2, No))
                    //Input_moji()
                }
                9 -> {
                    flag = 10
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.Setting_Select2, No))

                }
                10 -> {
                    /*設定　トップ画面*/
                    flag = 12
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.Setting_Select2, No))


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
                10 -> {
                    flag = 13
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.Setting_Select3, No))
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
                    mode = 10
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.Setting_NoSelect, No))


                }
                7 -> {
                    //バイブの設定　ダイアログ

                }
                8 -> {
                    //Menu1 姓名判断select1 へ行く。
                    mode = 6

                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.SeimeiHandan_NoSelect, No))
                    //  Input_moji()
                    //alertDialogDemo()
                }
                9 -> {
                    // Input_moji()
                }
                10 -> {
                    //姓名判断＝＝＞1.姓名判断
                    Input_SeiMeiHandan()


                }
                11->{
                    //1-2.姓名判断 2.相性占い
                    Input_name1_male()
                }
                12 -> {
                    Input_Kanji_Search()
                    // Input_moji()
                }
                13 -> {
                    //登録文字数の表示
                    Entry_Moji_check()
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

    //登録文字数の確認
    fun Entry_Moji_check() {
        var EntryMoji = 0
        //1画の文字
        val Search_1kaku = resources.getStringArray(R.array.Kaku1)
        //2画の文字
        val Search_2kaku = resources.getStringArray(R.array.Kaku2)
        //3画の文字
        val Search_3kaku = resources.getStringArray(R.array.Kaku3)
        //4画の文字
        val Search_4kaku = resources.getStringArray(R.array.Kaku4)
        //5画の文字
        val Search_5kaku = resources.getStringArray(R.array.Kaku5)
        //6画の文字
        val Search_6kaku = resources.getStringArray(R.array.Kaku6)
        //7画の文字
        val Search_7kaku = resources.getStringArray(R.array.Kaku7)
        //8画の文字
        val Search_8kaku = resources.getStringArray(R.array.Kaku8)
        //9画の文字
        val Search_9kaku = resources.getStringArray(R.array.Kaku9)
        //10画の文字
        val Search_10kaku = resources.getStringArray(R.array.Kaku10)

        //11画の文字
        val Search_11kaku = resources.getStringArray(R.array.Kaku11)

        //12画の文字
        val Search_12kaku = resources.getStringArray(R.array.Kaku12)

        //13画の文字
        val Search_13kaku = resources.getStringArray(R.array.Kaku13)
        //14画の文字
        val Search_14kaku = resources.getStringArray(R.array.Kaku14)
        //15画の文字
        val Search_15kaku = resources.getStringArray(R.array.Kaku15)
        //16画の文字
        val Search_16kaku = resources.getStringArray(R.array.Kaku16)
        //17画の文字
        val Search_17kaku = resources.getStringArray(R.array.Kaku17)


        //18画の文字
        val Search_18kaku = resources.getStringArray(R.array.Kaku18)

        //19画の文字
        val Search_19kaku = resources.getStringArray(R.array.Kaku19)
        //20画の文字
        val Search_20kaku = resources.getStringArray(R.array.Kaku20)
        //21画の文字
        val Search_21kaku = resources.getStringArray(R.array.Kaku21)
        //22画の文字
        val Search_22kaku = resources.getStringArray(R.array.Kaku22)
        //23画の文字
        val Search_23kaku = resources.getStringArray(R.array.Kaku23)
        //24画の文字
        val Search_24kaku = resources.getStringArray(R.array.Kaku24)

        EntryMoji = Search_1kaku.size + Search_2kaku.size + Search_3kaku.size + Search_4kaku.size +
                Search_5kaku.size + Search_6kaku.size + Search_7kaku.size + Search_8kaku.size +
                Search_9kaku.size + Search_10kaku.size + Search_11kaku.size + Search_12kaku.size
        +Search_13kaku.size + Search_14kaku.size + Search_15kaku.size + Search_16kaku.size + Search_17kaku.size
        +Search_18kaku.size + Search_19kaku.size + Search_20kaku.size + Search_21kaku.size + Search_22kaku.size
        +Search_23kaku.size + Search_24kaku.size


        val messageView: TextView = findViewById(R.id.view_screen)
        messageView.text = (getString(R.string.Entry_moji, EntryMoji))

    }

    fun customDialog() {
        // customDialogFragmentを呼ぶ
        val dialog = customdialog()
        dialog.show(supportFragmentManager, "dialog")
    }
/*
    fun kanjisearch() {
        // customDialogFragmentを呼ぶ
        val dialog2 = Kanji_Search()
        dialog2.show(supportFragmentManager, "dialog")
    }
*/

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

    //姓名判断
    fun Input_moji_Seimeihandan2(moji:String,c:Int)
    {


    }
    fun moji_SeiMeihandan1(mojiText: String): Int {
        //1画の文字
        val Search_1kaku = resources.getStringArray(R.array.Kaku1)
        //2画の文字
        val Search_2kaku = resources.getStringArray(R.array.Kaku2)
        //3画の文字
        val Search_3kaku = resources.getStringArray(R.array.Kaku3)
        //4画の文字
        val Search_4kaku = resources.getStringArray(R.array.Kaku4)
        //5画の文字
        val Search_5kaku = resources.getStringArray(R.array.Kaku5)
        //6画の文字
        val Search_6kaku = resources.getStringArray(R.array.Kaku6)
        //7画の文字
        val Search_7kaku = resources.getStringArray(R.array.Kaku7)
        //8画の文字
        val Search_8kaku = resources.getStringArray(R.array.Kaku8)
        //9画の文字
        val Search_9kaku = resources.getStringArray(R.array.Kaku9)
        //10画の文字
        val Search_10kaku = resources.getStringArray(R.array.Kaku10)
        //11画の文字
        val Search_11kaku = resources.getStringArray(R.array.Kaku11)
        //12画の文字
        val Search_12kaku = resources.getStringArray(R.array.Kaku12)

        //13画の文字
        val Search_13kaku = resources.getStringArray(R.array.Kaku13)
        //14画の文字
        val Search_14kaku = resources.getStringArray(R.array.Kaku14)
        //15画の文字
        val Search_15kaku = resources.getStringArray(R.array.Kaku15)
        //16画の文字
        val Search_16kaku = resources.getStringArray(R.array.Kaku16)
        //17画の文字
        val Search_17kaku = resources.getStringArray(R.array.Kaku17)

        //18画の文字
        val Search_18kaku = resources.getStringArray(R.array.Kaku18)
        //19画の文字
        val Search_19kaku = resources.getStringArray(R.array.Kaku19)
        //20画の文字
        val Search_20kaku = resources.getStringArray(R.array.Kaku20)
        //21画の文字
        val Search_21kaku = resources.getStringArray(R.array.Kaku21)
        //setContentView(R.layout.dialog2)
        //22画の文字
        val Search_22kaku = resources.getStringArray(R.array.Kaku22)
        //23画の文字
        val Search_23kaku = resources.getStringArray(R.array.Kaku23)
        //24画の文字
        val Search_24kaku = resources.getStringArray(R.array.Kaku24)
        var n = 0
        var count = 0
        var list = mojiText
        var m = 0
        //var j = 0
         var j=0
        //if ( moji != null) {

            //1画文字検索
            for (i in Search_1kaku) {
                if (mojiText == i) {

                    // if (mojiText == (i)) {
                    //var moji1 = "1画"
                    n = 1
                   // m = m + n
                   // count++

                    //}
                }
            }
            //2画検索
            for (i in Search_2kaku) {
                if (list == i) {
                    // var moji1 = "2画"
                   // count++
                    n = 2
                    //m = m + n
                    /*
                   val messageView: TextView = findViewById(R.id.view_screen)
                   messageView.text =
                       (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                   */
                }
            }
            //3画検索
            for (i in Search_3kaku) {
                if (list == (i)) {
                    //  var moji1 = "3画"
                    n = 3
                    //count++
                    /*
                  val messageView: TextView = findViewById(R.id.view_screen)
                  messageView.text =
                      (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                  */
                }
            }
            //4画検索
            for (i in Search_4kaku) {
                if (list == (i)) {
                    //var moji1 = "4画"
                    n = 4
                    //count++
                    /*
                  val messageView: TextView = findViewById(R.id.view_screen)
                  messageView.text =
                      (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                  */
                }
            }
            //5画検索
            for (i in Search_5kaku) {
                if (list == (i)) {
                    //var moji1 = "5画"
                    n = 5
                   // count++
                    /*
                   val messageView: TextView = findViewById(R.id.view_screen)
                   messageView.text =
                       (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                   */
                }
            }
            //6画検索
            for (i in Search_6kaku) {
                if (list == (i)) {
                    //       var moji1 = "6画"
                    n = 6
                    //count++
                    /*
                  val messageView: TextView = findViewById(R.id.view_screen)
                  messageView.text =
                      (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                  */
                }
            }
            //7画検索
            for (i in Search_7kaku) {
                if (list == (i)) {
                    //var moji1 = "7画"
                    n = 7
                    //count++
                    /*
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text =
                        (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                    */
                }
            }
            //8画検索
            for (i in Search_8kaku) {
                if (list == (i)) {
                    //var moji1 = "8画"
                    n = 8
                    //count++
                    /*
                   val messageView: TextView = findViewById(R.id.view_screen)
                   messageView.text =
                       (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                   */
                }
            }
            //9画検索
            for (i in Search_9kaku) {
                if (list == (i)) {
                    //var moji1 = "9画"
                    n = 9
                    //count++
                    /*
                  val messageView: TextView = findViewById(R.id.view_screen)
                  messageView.text =
                      (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                  */
                }
            }
            //10画検索
            for (i in Search_10kaku) {
                if (list == (i)) {
                    //var moji1 = "10画"
                    n = 10
                    //count++
                    /*
                   val messageView: TextView = findViewById(R.id.view_screen)
                   messageView.text =
                       (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                   */
                }
            }
            //11画検索
            for (i in Search_11kaku) {
                if (list == (i)) {
                    //var moji1 = "11画"
                    n = 11
                    //count++
                    /*
                   val messageView: TextView = findViewById(R.id.view_screen)
                   messageView.text =
                       (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                   */
                }
            }
            //12画検索
            for (i in Search_12kaku) {
                if (list == (i)) {
                    //var moji1 = "12画"
                    n = 12
                    //count++
                    /*
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text =
                        (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                    */
                }
            }
            //13画検索
            for (i in Search_13kaku) {
                if (list == (i)) {
                    //var moji1 = "13画"
                   // count++
                    n = 13
                    /*
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text =
                        (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                    */
                }
            }
            //14画検索
            for (i in Search_14kaku) {
                if (list == (i)) {
                    //var moji1 = "14画"
                    n = 14
                    //count++
                    /*
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text =
                        (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                    */
                }
            }
            //15画検索
            for (i in Search_15kaku) {
                if (list == (i)) {
                    //var moji1 = "15画"
                    n = 15
                    //count++
                    /*
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text =
                        (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                      */
                }

            }
            //16画検索
            for (i in Search_16kaku) {
                if (list == (i)) {
                    //var moji1 = "16画"
                    n = 16
                    //count++
                    /*
                  val messageView: TextView = findViewById(R.id.view_screen)
                  messageView.text =
                      (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                  */
                }
            }
            //17画検索
            for (i in Search_17kaku) {
                if (list == (i)) {
                    //var moji1 = "17画"
                    n = 17
                   // count++
                    /*
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text =
                        (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                    */
                }
            }
            //18画検索
            for (i in Search_18kaku) {
                if (list == (i)) {
                    //var moji1 = "18画"
                    n = 18
                   // count++
                    /*
                  val messageView: TextView = findViewById(R.id.view_screen)
                  messageView.text =
                      (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                  */
                }
            }
            //19画検索
            for (i in Search_19kaku) {
                if (list == (i)) {
                    //var moji1 = "19画"
                    n = 19
                    //count++
                    /*
                  val messageView: TextView = findViewById(R.id.view_screen)
                  messageView.text =
                      (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                  */
                }
            }
            //20画検索
            for (i in Search_20kaku) {
                if (list == (i)) {
                    //var moji1 = "20画"
                    n = 20
                    //count++
                    /*
                  val messageView: TextView = findViewById(R.id.view_screen)
                  messageView.text =
                      (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                  */
                }
            }
            //21画検索
            for (i in Search_21kaku) {
                if (list == (i)) {
                    //var moji1 = "21画"
                    n = 21
                    //count++
                    /*
                     val messageView: TextView = findViewById(R.id.view_screen)
                     messageView.text =
                         (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                     */
                }
            }
            //22画検索
            for (i in Search_22kaku) {
                if (list == (i)) {
                    //var moji1 = "22画"
                    n = 22
                    //count++
                    /*
                  val messageView: TextView = findViewById(R.id.view_screen)
                  messageView.text =
                      (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                  */
                }
            }
            //23画検索
            for (i in Search_23kaku) {
                if (list == (i)) {
                    //var moji1 = "23画"
                    n = 23
                    //count++
                    /*
                   val messageView: TextView = findViewById(R.id.view_screen)
                   messageView.text =
                       (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                   */
                }
            }
            //24画検索
            for (i in Search_24kaku) {
                if (list == (i)) {
                    //var moji1 = "24画"
                    n = 24
                    //count++
                    /*
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text =
                        (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                    */
                }

            }

             return n
        /*
                     val messageView: TextView = findViewById(R.id.view_screen)
                     messageView.text =
                         (getString(R.string.Result_Search_moji_Message2, mojiText, n))
                     */
        //   j++
/*
    if (count == 0)
    {
        val messageView: TextView = findViewById(R.id.view_screen)
        messageView.text = (getString(R.string.Result_NoEntry))

    }
*/
}












    @SuppressLint("StringFormatMatches")
    fun Result_moji_search(mojiText: String) {
         var n = 0
         var count = 0
         var moji = "この文字は登録されていません"
         //val res = requireContext().resources
         //1画の文字
         val Search_1kaku = resources.getStringArray(R.array.Kaku1)
         //2画の文字
         val Search_2kaku = resources.getStringArray(R.array.Kaku2)
         //3画の文字
         val Search_3kaku = resources.getStringArray(R.array.Kaku3)
         //4画の文字
         val Search_4kaku = resources.getStringArray(R.array.Kaku4)
         //5画の文字
         val Search_5kaku = resources.getStringArray(R.array.Kaku5)
         //6画の文字
         val Search_6kaku = resources.getStringArray(R.array.Kaku6)
         //7画の文字
         val Search_7kaku = resources.getStringArray(R.array.Kaku7)
         //8画の文字
         val Search_8kaku = resources.getStringArray(R.array.Kaku8)
         //9画の文字
         val Search_9kaku = resources.getStringArray(R.array.Kaku9)
         //10画の文字
         val Search_10kaku = resources.getStringArray(R.array.Kaku10)
         //11画の文字
         val Search_11kaku = resources.getStringArray(R.array.Kaku11)
         //12画の文字
         val Search_12kaku = resources.getStringArray(R.array.Kaku12)

         //13画の文字
         val Search_13kaku = resources.getStringArray(R.array.Kaku13)
         //14画の文字
         val Search_14kaku = resources.getStringArray(R.array.Kaku14)
         //15画の文字
         val Search_15kaku = resources.getStringArray(R.array.Kaku15)
         //16画の文字
         val Search_16kaku = resources.getStringArray(R.array.Kaku16)
         //17画の文字
         val Search_17kaku = resources.getStringArray(R.array.Kaku17)

         //18画の文字
         val Search_18kaku = resources.getStringArray(R.array.Kaku18)
         //19画の文字
         val Search_19kaku = resources.getStringArray(R.array.Kaku19)
         //20画の文字
         val Search_20kaku = resources.getStringArray(R.array.Kaku20)
         //21画の文字
         val Search_21kaku = resources.getStringArray(R.array.Kaku21)
         //setContentView(R.layout.dialog2)
         //22画の文字
         val Search_22kaku = resources.getStringArray(R.array.Kaku22)
         //23画の文字
         val Search_23kaku = resources.getStringArray(R.array.Kaku23)
         //24画の文字
         val Search_24kaku = resources.getStringArray(R.array.Kaku24)
         //var editTextDialog  = findViewById(R.id.editTextDialog)
         // val signinView = this.inflate(R.layout.dialog2, null)
         //val builder = AlertDialog.Builder(R.layout.dialog2)
         // var mojiText = editTextDialog.text.toString()

            if ( moji != null) {
                 //1画文字検索
                 for (i in Search_1kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "1画"
                        count++
                            val messageView: TextView = findViewById(R.id.view_screen)
                              messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                     }
                   }
                 //2画検索
                for (i in Search_2kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "2画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //3画検索
                for (i in Search_3kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "3画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //4画検索
                for (i in Search_4kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "4画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //5画検索
                for (i in Search_5kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "5画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //6画検索
                for (i in Search_6kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "6画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //7画検索
                for (i in Search_7kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "7画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //8画検索
                for (i in Search_8kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "8画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //9画検索
                for (i in Search_9kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "9画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //10画検索
                for (i in Search_10kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "10画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //11画検索
                for (i in Search_11kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "11画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //12画検索
                for (i in Search_12kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "12画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //13画検索
                for (i in Search_13kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "13画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //14画検索
                for (i in Search_14kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "14画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //15画検索
                for (i in Search_15kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "15画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //16画検索
                for (i in Search_16kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "16画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //17画検索
                for (i in Search_17kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "17画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //18画検索
                for (i in Search_18kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "18画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //19画検索
                for (i in Search_19kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "19画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //20画検索
                for (i in Search_20kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "20画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //21画検索
                for (i in Search_21kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "21画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //22画検索
                for (i in Search_22kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "22画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //23画検索
                for (i in Search_23kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "23画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //24画検索
                for (i in Search_24kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "24画"
                        count++
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                if (count == 0)
                {
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.Result_NoEntry))

                }
            }

     }

    @SuppressLint("StringFormatMatches")
    fun Result_Message(message: String, count_n : Int)
    {
        AlertDialog.Builder(this)
            .setTitle(R.string.Result_Search_moji_Title)
           // .setMessage(getString(R.string.Result_Search_moji_Message))
            .setMessage(getString(R.string.Result_Search_moji_Message2, message,count_n))
            .setPositiveButton(R.string.Ok) { dialog, which -> }
            .show()

    }
         // 漢字検索
         fun Kanji_Search() {
             //Kanji_Search()
         }
    //1.男性　の地運を求める
    fun Get_male_chiun(mojiText1: String,mojiText2: String): Int {
        var mojiText = mojiText1 + mojiText2
        chiun = 0
        buf_chiun=0
        when(mojiText.length)
        {
            2 -> {
                buf_chiun =  moji_SeiMeihandan1(mojiText.substring(mojiText.length - 1))
                if (buf_chiun > 9 && buf_chiun < 20)
                {
                    chiun = buf_chiun - 10
                }
                else if(buf_chiun > 19 && buf_chiun < 30)
                {
                    chiun = buf_chiun - 20
                }
                else if(buf_chiun < 10)
                {
                    chiun = buf_chiun
                }
                else
                {
                    chiun = buf_chiun - 30
                }
            // chiun = moji_SeiMeihandan1( mojiText.takeLast(1))
            }
            3->{
                if (mojiText2.length == 2)
                {
                   var mojitext2_1 = moji_SeiMeihandan1(mojiText2.substring(0,1))
                   var mojiText2_2 =  moji_SeiMeihandan1(mojiText2.substring(1,2))
                   var  buf_chiun = mojitext2_1 + mojiText2_2
                    if (buf_chiun > 9 && buf_chiun < 20)
                    {
                        chiun = buf_chiun - 10
                    }
                    else if(buf_chiun > 19 && buf_chiun < 30)
                    {
                        chiun = buf_chiun - 20
                    }
                    else if(buf_chiun < 10)
                    {
                        chiun = buf_chiun
                    }
                    else
                    {
                        chiun = buf_chiun - 30
                    }

                }
                else  if (mojiText2.length == 1)
                {
                    var mojitext2_1 = moji_SeiMeihandan1(mojiText2.substring(0,1))

                    var  buf_chiun = mojitext2_1
                    if (buf_chiun > 9 && buf_chiun < 20)
                    {
                        chiun = buf_chiun - 10
                    }
                    else if(buf_chiun > 19 && buf_chiun < 30)
                    {
                        chiun = buf_chiun - 20
                    }
                    else if(buf_chiun < 10)
                    {
                        chiun = buf_chiun
                    }
                    else
                    {
                        chiun = buf_chiun - 30
                    }

                }
            }
            4->{
                if (mojiText2.length == 2) {
                    var mojiText2_1 = moji_SeiMeihandan1(mojiText2.substring(0,1))
                    var mojiText2_2 =  moji_SeiMeihandan1(mojiText2.substring(1,2))
                    buf_chiun = mojiText2_1 + mojiText2_2
                    if (buf_chiun > 9 && buf_chiun < 20)
                    {
                        chiun = buf_chiun - 10
                    }
                    else if(buf_chiun > 19 && buf_chiun < 30)
                    {
                        chiun = buf_chiun - 20
                    }
                    else if(buf_chiun < 10)
                    {
                        chiun = buf_chiun
                    }
                    else
                    {
                        chiun = buf_chiun - 30
                    }


                }
                else if (mojiText2.length == 3) {

                        var mojiText3_1 = moji_SeiMeihandan1(mojiText2.substring(0,1))
                        var mojiText3_2 =  moji_SeiMeihandan1(mojiText2.substring(1,2))
                        var mojiText3_3 =  moji_SeiMeihandan1(mojiText2.substring(1,2))

                    buf_chiun = mojiText3_1 + mojiText3_2 + mojiText3_3
                        if (buf_chiun > 9 && buf_chiun < 20)
                        {
                            chiun = buf_chiun - 10
                        }
                        else if(buf_chiun > 19 && buf_chiun < 30)
                        {
                            chiun = buf_chiun - 20
                        }
                        else if(buf_chiun < 10)
                        {
                            chiun = buf_chiun
                        }
                        else
                        {
                            chiun = buf_chiun - 30
                        }
                }
                else if (mojiText2.length == 1) {
                    var mojiText3_1 = moji_SeiMeihandan1(mojiText2.substring(0,1))


                    buf_chiun = mojiText3_1
                    if (buf_chiun > 9 && buf_chiun < 20)
                    {
                        chiun = buf_chiun - 10
                    }
                    else if(buf_chiun > 19 && buf_chiun < 30)
                    {
                        chiun = buf_chiun - 20
                    }
                    else if(buf_chiun < 10)
                    {
                        chiun = buf_chiun
                    }
                    else
                    {
                        chiun = buf_chiun - 30
                    }
                  }
                }
            5->{
                var mojiText5_1 = moji_SeiMeihandan1(mojiText2.substring(0,1))
                var mojiText5_2 =  moji_SeiMeihandan1(mojiText2.substring(1,2))
                if (mojiText2.length == 2) {
                    buf_chiun = mojiText5_1 + mojiText5_2
                    if (buf_chiun > 9 && buf_chiun < 20)
                    {
                        chiun = buf_chiun - 10
                    }
                    else if(buf_chiun > 19 && buf_chiun < 30)
                    {
                        chiun = buf_chiun - 20
                    }
                    else if(buf_chiun < 10)
                    {
                        chiun = buf_chiun
                    }
                    else
                    {
                        chiun = buf_chiun - 30
                    }

                 }
                else if (mojiText2.length == 3) {
                    var mojiText5_1 = moji_SeiMeihandan1(mojiText2.substring(0,1))
                    var mojiText5_2 =  moji_SeiMeihandan1(mojiText2.substring(1,2))
                    var mojiText5_3 =  moji_SeiMeihandan1(mojiText2.substring(2,3))
                    buf_chiun = mojiText5_1 + mojiText5_2 + mojiText5_3
                    if (buf_chiun > 9 && buf_chiun < 20)
                    {
                        chiun = buf_chiun - 10
                    }
                    else if(buf_chiun > 19 && buf_chiun < 30)
                    {
                        chiun = buf_chiun - 20
                    }
                    else if(buf_chiun < 10)
                    {
                        chiun = buf_chiun
                    }
                    else
                    {
                        chiun = buf_chiun - 30
                    }

                }
             }

        }
        return chiun
    //    val messageView: TextView = findViewById(R.id.view_screen)
    ///messageView.text = (getString(R.string.Chiun_moji,chiun))
        }
//女性の外運を求める
    fun Get_female_Gaiunn(mojiText3: String,mojiText4: String): Int {

        var mojiText = mojiText3 + mojiText4
        gaiun = 0
        buf_gaiun=0
        buf_gaiun2=0
        buf_gaiun3=0
        when(mojiText.length)
        {
           2->{
               buf_gaiun = moji_SeiMeihandan1(mojiText.substring(0,1))
               buf_gaiun2 = moji_SeiMeihandan1(mojiText.substring(1,2))
               gaiun = buf_gaiun + buf_gaiun2
               if (gaiun > 9 && gaiun < 20)
               {
                   gaiun = gaiun - 10
               }
               else if(gaiun > 19 && gaiun < 30)
               {
                   gaiun = gaiun - 20
               }
               else if(gaiun < 10)
               {
                   gaiun = gaiun
               }
               else
               {
                   gaiun = gaiun - 30
               }
           }
            3->{
                if (mojiText3.length == 1) {
                    buf_gaiun = moji_SeiMeihandan1(mojiText3.substring(0, 1))
                    buf_gaiun2 = moji_SeiMeihandan1(mojiText4.substring(1, 2))
                    gaiun = buf_gaiun + buf_gaiun2
                    if (gaiun > 9 && gaiun < 20)
                    {
                        gaiun = gaiun - 10
                    }
                    else if(gaiun > 19 && gaiun < 30)
                    {
                        gaiun = gaiun - 20
                    }
                    else if(gaiun < 10)
                    {
                        gaiun = gaiun
                    }
                    else
                    {
                        gaiun = gaiun - 30
                    }
                }
                else if (mojiText3.length == 2){
                    buf_gaiun = moji_SeiMeihandan1(mojiText3.substring(0, 1))
                    buf_gaiun2 = moji_SeiMeihandan1(mojiText4.substring(0,1 ))
                    gaiun = buf_gaiun + buf_gaiun2
                    if (gaiun > 9 && gaiun < 20)
                    {
                        gaiun = gaiun - 10
                    }
                    else if(gaiun > 19 && gaiun < 30)
                    {
                        gaiun = gaiun - 20
                    }
                    else if(gaiun < 10)
                    {
                        gaiun = gaiun
                    }
                    else
                    {
                        gaiun = gaiun - 30
                    }
                }

            }
            4 -> {
                if (mojiText3.length == 1) {
                    buf_gaiun = moji_SeiMeihandan1(mojiText.substring(0, 1))
                    buf_gaiun2 = moji_SeiMeihandan1(mojiText.substring(2, 3))
                    buf_gaiun3 = moji_SeiMeihandan1(mojiText.substring(3, 4))
                    gaiun = buf_gaiun + buf_gaiun2 + buf_gaiun3
                    if (gaiun > 9 && gaiun < 20)
                    {
                        gaiun = gaiun - 10
                    }
                    else if(gaiun > 19 && gaiun < 30)
                    {
                        gaiun = gaiun - 20
                    }
                    else if(gaiun < 10)
                    {
                        gaiun = gaiun
                    }
                    else
                    {
                        gaiun = gaiun - 30
                    }

                }
                else if (mojiText3.length == 2){
                    buf_gaiun = moji_SeiMeihandan1(mojiText.substring(0, 1))
                    buf_gaiun2 = moji_SeiMeihandan1(mojiText.substring(3, 4))

                    gaiun = buf_gaiun + buf_gaiun2
                    if (gaiun > 9 && gaiun < 20)
                    {
                        gaiun = gaiun - 10
                    }
                    else if(gaiun > 19 && gaiun < 30)
                    {
                        gaiun = gaiun - 20
                    }
                    else if(gaiun < 10)
                    {
                        gaiun = gaiun
                    }
                    else
                    {
                        gaiun = gaiun - 30
                    }
                }
                else if (mojiText3.length == 3){
                    buf_gaiun = moji_SeiMeihandan1(mojiText3.substring(0, 1))
                    buf_gaiun2 = moji_SeiMeihandan1(mojiText3.substring(1, 2))
                    buf_gaiun3 = moji_SeiMeihandan1(mojiText4.substring(0, 1))

                    gaiun = buf_gaiun + buf_gaiun2+ buf_gaiun3
                    if (gaiun > 9 && gaiun < 20)
                    {
                        gaiun = gaiun - 10
                    }
                    else if(gaiun > 19 && gaiun < 30)
                    {
                        gaiun = gaiun - 20
                    }
                    else if(gaiun < 10)
                    {
                        gaiun = gaiun
                    }
                    else
                    {
                        gaiun = gaiun - 30
                    }
                }
            }
            5->{
                if (mojiText3.length == 3) {
                    buf_gaiun = moji_SeiMeihandan1(mojiText.substring(0, 1))
                    buf_gaiun2 = moji_SeiMeihandan1(mojiText.substring(1, 2))
                    buf_gaiun3 = moji_SeiMeihandan1(mojiText.substring(4, 5))
                    gaiun = buf_gaiun + buf_gaiun2 + buf_gaiun3
                    if (gaiun > 9 && gaiun < 20)
                    {
                        gaiun = gaiun - 10
                    }
                    else if(gaiun > 19 && gaiun < 30)
                    {
                        gaiun = gaiun - 20
                    }
                    else if(gaiun < 10)
                    {
                        gaiun = gaiun
                    }
                    else
                    {
                        gaiun = gaiun - 30
                    }

                }
                else if (mojiText3.length == 2) {
                        buf_gaiun = moji_SeiMeihandan1(mojiText.substring(0, 1))
                        buf_gaiun2 = moji_SeiMeihandan1(mojiText.substring(3, 4))
                        buf_gaiun3 = moji_SeiMeihandan1(mojiText.substring(4, 5))
                        gaiun = buf_gaiun + buf_gaiun2 + buf_gaiun3
                        if (gaiun > 9 && gaiun < 20)
                        {
                            gaiun = gaiun - 10
                        }
                        else if(gaiun > 19 && gaiun < 30)
                        {
                            gaiun = gaiun - 20
                        }
                        else if(gaiun < 10)
                        {
                            gaiun = gaiun
                        }
                        else
                        {
                            gaiun = gaiun - 30
                        }
                 }
            }
        }
        return gaiun
        //val messageView: TextView = findViewById(R.id.view_screen)
        //messageView.text = (getString(R.string.Gai_moji,gaiun))
    }
//3.男性、女性の相性判定
    fun Get_Aisyou(a: Int,b: Int ): String {
    /*
         0:1.理解しあえる最良のカップル
         1:2.お互いに自然体で付き合える二人
         2:3.男性にとって居心地の良いカップル
         3:4.女性にとって居心地の良いカップル
         4:5.恋愛経験を重ねた後なら愛を育める
         5:6.結婚への発展が困難なカップル
         6:7.愛し方にずれが出てくる二人
         7:8.互いの価値観がかみ合わない相性
     */
    val Result_Aisyou = resources.getStringArray(R.array.AisyouList)

    val result =
            //0
            arrayOf(arrayOf(Result_Aisyou[7],Result_Aisyou[5],Result_Aisyou[3],Result_Aisyou[1],Result_Aisyou[7],Result_Aisyou[0],Result_Aisyou[6],Result_Aisyou[1],Result_Aisyou[3],Result_Aisyou[2]),
            //1
                arrayOf(Result_Aisyou[4],Result_Aisyou[2],Result_Aisyou[6],Result_Aisyou[3],Result_Aisyou[7],Result_Aisyou[6],Result_Aisyou[1],Result_Aisyou[4],Result_Aisyou[0],Result_Aisyou[3]),

            //2
                                           arrayOf(Result_Aisyou[2],Result_Aisyou[3],Result_Aisyou[3],Result_Aisyou[5],Result_Aisyou[4],Result_Aisyou[1],Result_Aisyou[0],Result_Aisyou[6],Result_Aisyou[7],Result_Aisyou[7]),

            //3
                                            arrayOf(Result_Aisyou[6],Result_Aisyou[7],Result_Aisyou[1],Result_Aisyou[1],Result_Aisyou[2],Result_Aisyou[5],Result_Aisyou[4],Result_Aisyou[4],Result_Aisyou[6],Result_Aisyou[0]),

            //4
                                             arrayOf(Result_Aisyou[1],Result_Aisyou[1],Result_Aisyou[7],Result_Aisyou[5],Result_Aisyou[1],Result_Aisyou[4],Result_Aisyou[5],Result_Aisyou[0],Result_Aisyou[7],Result_Aisyou[1]),

            //5
                                              arrayOf(Result_Aisyou[7],Result_Aisyou[0],Result_Aisyou[3],Result_Aisyou[6],Result_Aisyou[7],Result_Aisyou[3],Result_Aisyou[6],Result_Aisyou[0],Result_Aisyou[7],Result_Aisyou[0]),

            //6
                                                arrayOf(Result_Aisyou[7],Result_Aisyou[0],Result_Aisyou[0],Result_Aisyou[4],Result_Aisyou[3],Result_Aisyou[2],Result_Aisyou[1],Result_Aisyou[1],Result_Aisyou[1],Result_Aisyou[3]),

            //7
                                               arrayOf(Result_Aisyou[3],Result_Aisyou[1],Result_Aisyou[1],Result_Aisyou[7],Result_Aisyou[0],Result_Aisyou[4],Result_Aisyou[5],Result_Aisyou[5],Result_Aisyou[3],Result_Aisyou[6]),

            //8
                                                arrayOf(Result_Aisyou[1],Result_Aisyou[0],Result_Aisyou[4],Result_Aisyou[4],Result_Aisyou[7],Result_Aisyou[2],Result_Aisyou[6],Result_Aisyou[1],Result_Aisyou[1],Result_Aisyou[3]),

            //9
                                                arrayOf(Result_Aisyou[1],Result_Aisyou[7],Result_Aisyou[7],Result_Aisyou[5],Result_Aisyou[2],Result_Aisyou[6],Result_Aisyou[1],Result_Aisyou[6],Result_Aisyou[2],Result_Aisyou[7]))



           return  result[a][b]
    }
//1.男性名前入力　姓の部分
fun Input_name1_male()
         {

                 // ダイアログ専用のレイアウトを読み込む
             val  dialogLayout = LayoutInflater.from(this).inflate(R.layout.input_name_male, null)
             val  editText = dialogLayout.findViewById<AppCompatEditText>(R.id.editTextDialog)

// ダイアログ作成
                 val dialog = AlertDialog.Builder(this)
                     .setTitle(R.string.Aisyou_Message_Title)
                     .setMessage(R.string.Aisyou_Message_Message)
                     .setView(dialogLayout)
                     .setPositiveButton(R.string.Ok) { dialog, _ ->
                         moji_male = editText.text.toString()
                         //2.男性　名　入力
                          Input_name2_male()
                         // OKボタンを押したときの処理
                         dialog.dismiss()
                     }
                     .setNegativeButton("キャンセル") { dialog, _ ->
                         // キャンセルボタンを押したときの処理
                         dialog.dismiss()
                     }
                     .create()
                 dialog.show()

// ダイアログのボタンを取得し、デフォルトの色を「#000000」に設定
                 dialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(getColor(R.color.black))
                 dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setTextColor(getColor(R.color.black))

// AppCompatEditTextにTextChangedListenerをセット
                 editText.addTextChangedListener(object : TextWatcher {
                     override fun beforeTextChanged(
                         s: CharSequence?,
                         start: Int,
                         count: Int,
                         after: Int
                     ) {
                     }

                     override fun onTextChanged(
                         s: CharSequence?,
                         start: Int,
                         before: Int,
                         count: Int
                     ) {
                     }

                     @SuppressLint("NewApi")
                     override fun afterTextChanged(s: Editable?) {
                         // 1~32文字の時だけOKボタンを有効化する
                         if (s.isNullOrEmpty() || s.length > 32) {
                             dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = false
                             dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                                 .setTextColor(getColor(R.color.gray))
                         } else {
                             dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = true
                             dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                                 .setTextColor(getColor(R.color.black))
                         }
                     }
                 })

         }

    //2.男性名前入力　名の部分

    fun Input_name2_male()
   {

    // ダイアログ専用のレイアウトを読み込む
       val dialogLayout2 = LayoutInflater.from(this).inflate(R.layout.input_name2_male, null)
       val  editText2 = dialogLayout2.findViewById<AppCompatEditText>(R.id.editTextDialog2)

// ダイアログ作成
    val dialog = AlertDialog.Builder(this)
        .setTitle(R.string.Aisyou_Message_Title)
        .setMessage( R.string.Aisyou_Message2_Message)
        .setView(dialogLayout2)
        .setPositiveButton(R.string.Ok) { dialog, _ ->
          moji2_male = editText2.text.toString()
          name1_male = moji_male + moji2_male
          //  moji?.let { Get_male_chiun(it, moji2!!) }
            Input_name1_female()
            // OKボタンを押したときの処理
            dialog.dismiss()


        }
        .setNegativeButton("キャンセル") { dialog, _ ->
            // キャンセルボタンを押したときの処理
            dialog.dismiss()
        }
        .create()
    dialog.show()

// ダイアログのボタンを取得し、デフォルトの色を「#000000」に設定
    dialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(getColor(R.color.black))
    dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setTextColor(getColor(R.color.black))

// AppCompatEditTextにTextChangedListenerをセット
    editText2.addTextChangedListener(object : TextWatcher {
        override fun beforeTextChanged(
            s: CharSequence?,
            start: Int,
            count: Int,
            after: Int
        ) {
        }

        override fun onTextChanged(
            s: CharSequence?,
            start: Int,
            before: Int,
            count: Int
        ) {
        }

        @SuppressLint("NewApi")
        override fun afterTextChanged(s: Editable?) {
            // 1~32文字の時だけOKボタンを有効化する
            if (s.isNullOrEmpty() || s.length > 32) {
                dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = false
                dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                    .setTextColor(getColor(R.color.gray))
            } else {
                dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = true
                dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                    .setTextColor(getColor(R.color.black))
            }
        }
    })

}
//3.女性　姓入力

    fun Input_name1_female()
    {
        // ダイアログ専用のレイアウトを読み込む
        val dialogLayout3 = LayoutInflater.from(this).inflate(R.layout.input_name_female, null)
        val editText3 = dialogLayout3.findViewById<AppCompatEditText>(R.id.editTextDialog)

// ダイアログ作成
        val dialog = AlertDialog.Builder(this)
            .setTitle(R.string.Aisyou_Message_Title)
            .setMessage(R.string.Aisyou_Message_Message2)
            .setView(dialogLayout3)
            .setPositiveButton(R.string.Ok) { dialog, _ ->
                moji_female = editText3.text.toString()
                Input_name2_female()
                // OKボタンを押したときの処理
                dialog.dismiss()
            }
            .setNegativeButton("キャンセル") { dialog, _ ->
                // キャンセルボタンを押したときの処理
                dialog.dismiss()
            }
            .create()
        dialog.show()

// ダイアログのボタンを取得し、デフォルトの色を「#000000」に設定
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(getColor(R.color.black))
        dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setTextColor(getColor(R.color.black))

// AppCompatEditTextにTextChangedListenerをセット
        editText3.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(
                s: CharSequence?,
                start: Int,
                count: Int,
                after: Int
            ) {
            }

            override fun onTextChanged(
                s: CharSequence?,
                start: Int,
                before: Int,
                count: Int
            ) {
            }

            @SuppressLint("NewApi")
            override fun afterTextChanged(s: Editable?) {
                // 1~32文字の時だけOKボタンを有効化する
                if (s.isNullOrEmpty() || s.length > 32) {
                    dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = false
                    dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                        .setTextColor(getColor(R.color.gray))
                } else {
                    dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = true
                    dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                        .setTextColor(getColor(R.color.black))
                }
            }
        })
    }


//4.女性　名入力

    fun Input_name2_female()
    {
        // ダイアログ専用のレイアウトを読み込む
        val dialogLayout4 = LayoutInflater.from(this).inflate(R.layout.input_name2_female, null)
        val editText4 = dialogLayout4.findViewById<AppCompatEditText>(R.id.editTextDialog)

// ダイアログ作成
        val dialog = AlertDialog.Builder(this)
            .setTitle(R.string.Aisyou_Message_Title)
            .setMessage(R.string.Aisyou_Message2_Message2)
            .setView(dialogLayout4)
            .setPositiveButton(R.string.Ok) { dialog, _ ->
               // moji_female = editText3.text.toString()
                moji2_female = editText4.text.toString()
                name2_female = moji_female + moji2_female
                //moji_male?.let { Get_male_chiun(it, moji2_male!!) }
                //moji_male?.let { Get_Gaiunn(it, moji2_male!!) }
               // moji_female?.let {Get_female_Gaiunn(it,moji2_female!!)}
                buffer_chiun = moji2_male?.let { moji_male?.let { it1 -> Get_male_chiun(it1, it) } }!!
                buffer_gaiun = moji_female?.let { Get_female_Gaiunn(it, moji2_female!!) }!!
                val messageView: TextView = findViewById(R.id.view_screen)
                var Aisyou_List=Get_Aisyou(buffer_chiun ,buffer_gaiun )
                messageView.text = (getString(R.string.Result_Chiun_moji_Gai_moji,name1_male, buffer_chiun,name2_female,buffer_gaiun,Aisyou_List))
                // OKボタンを押したときの処理
                dialog.dismiss()
            }
            .setNegativeButton("キャンセル") { dialog, _ ->
                // キャンセルボタンを押したときの処理
                dialog.dismiss()
            }
            .create()
        dialog.show()

// ダイアログのボタンを取得し、デフォルトの色を「#000000」に設定
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(getColor(R.color.black))
        dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setTextColor(getColor(R.color.black))

// AppCompatEditTextにTextChangedListenerをセット
        editText4.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(
                s: CharSequence?,
                start: Int,
                count: Int,
                after: Int
            ) {
            }

            override fun onTextChanged(
                s: CharSequence?,
                start: Int,
                before: Int,
                count: Int
            ) {
            }

            @SuppressLint("NewApi")
            override fun afterTextChanged(s: Editable?) {
                // 1~32文字の時だけOKボタンを有効化する
                if (s.isNullOrEmpty() || s.length > 32) {
                    dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = false
                    dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                        .setTextColor(getColor(R.color.gray))
                } else {
                    dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = true
                    dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                        .setTextColor(getColor(R.color.black))
                }
            }
        })
    }




         fun Input_SeiMeiHandan() {
             // ダイアログ専用のレイアウトを読み込む
             val dialogLayout = LayoutInflater.from(this).inflate(R.layout.dialog3, null)
             val editText = dialogLayout.findViewById<AppCompatEditText>(R.id.editTextDialog)
             val Kikkyo = resources.getStringArray(R.array.Kikkyo_total)
// ダイアログ作成
             val dialog = AlertDialog.Builder(this)
                 .setTitle(R.string.MojiKikkyo_Title)
                 .setMessage(R.string.MojiKikkyo_Message)
                 .setView(dialogLayout)
                 .setPositiveButton(R.string.Ok) { dialog, _ ->
                     val moji = editText.text.toString()
                     var j=0
                     var total = 0

                     while (moji.length > j) {

                         when (moji.length) {
                             1 -> {
                                 total = moji_SeiMeihandan1(moji)
                                 j++
                             }
                             2 -> {

                                 var moji1 = moji.take(1)
                                 var moji2 = moji.takeLast(1)
                                 var a1 = moji_SeiMeihandan1(moji1)
                                 var a2 = moji_SeiMeihandan1(moji2)
                                 total = a1 + a2
                                 j++
                             }

                             3 -> {
                                 var moji1 = moji.substring(0, 1)
                                 var moji2 = moji.substring(1, 2)
                                 var moji3 = moji.substring(2, 3)

                                 var a1 = moji_SeiMeihandan1(moji1)
                                 var a2 = moji_SeiMeihandan1(moji2)
                                 var a3 = moji_SeiMeihandan1(moji3)

                                 total = a1 + a2 + a3
                                 j++
                             }
                             4 -> {
                                 var moji1 = moji.substring(0, 1)
                                 var moji2 = moji.substring(1, 2)
                                 var moji3 = moji.substring(2, 3)
                                 var moji4 = moji.substring(3, 4)

                                 var a1 = moji_SeiMeihandan1(moji1)
                                 var a2 = moji_SeiMeihandan1(moji2)
                                 var a3 = moji_SeiMeihandan1(moji3)
                                 var a4 = moji_SeiMeihandan1(moji4)

                                 total = a1 + a2 + a3 + a4
                                 j++
                             }
                             4 -> {
                                 var moji1 = moji.substring(0, 1)
                                 var moji2 = moji.substring(1, 2)
                                 var moji3 = moji.substring(2, 3)
                                 var moji4 = moji.substring(3, 4)

                                 var a1 = moji_SeiMeihandan1(moji1)
                                 var a2 = moji_SeiMeihandan1(moji2)
                                 var a3 = moji_SeiMeihandan1(moji3)
                                 var a4 = moji_SeiMeihandan1(moji4)

                                 total = a1 + a2 + a3 + a4
                                 j++
                             }
                             5 -> {
                                 var moji1 = moji.substring(0, 1)
                                 var moji2 = moji.substring(1, 2)
                                 var moji3 = moji.substring(2, 3)
                                 var moji4 = moji.substring(3, 4)
                                 var moji5 = moji.substring(4, 5)

                                 var a1 = moji_SeiMeihandan1(moji1)
                                 var a2 = moji_SeiMeihandan1(moji2)
                                 var a3 = moji_SeiMeihandan1(moji3)
                                 var a4 = moji_SeiMeihandan1(moji4)
                                 var a5 = moji_SeiMeihandan1(moji5)

                                 total = a1 + a2 + a3 + a4 + a5
                                 j++
                             }
                             6 -> {
                                 var moji1 = moji.substring(0, 1)
                                 var moji2 = moji.substring(1, 2)
                                 var moji3 = moji.substring(2, 3)
                                 var moji4 = moji.substring(3, 4)
                                 var moji5 = moji.substring(4, 5)
                                 var moji6 = moji.substring(5, 6)

                                 var a1 = moji_SeiMeihandan1(moji1)
                                 var a2 = moji_SeiMeihandan1(moji2)
                                 var a3 = moji_SeiMeihandan1(moji3)
                                 var a4 = moji_SeiMeihandan1(moji4)
                                 var a5 = moji_SeiMeihandan1(moji5)
                                 var a6 = moji_SeiMeihandan1(moji6)

                                 total = a1 + a2 + a3 + a4 + a5 + a6
                                 j++
                             }
                             else ->{

                             }
                         }
                     }
                     if (moji.length > 6)
                     {
                         Toast.makeText(this,R.string.moji_over,Toast.LENGTH_SHORT).show()
                     }
                     else {
                         val messageView: TextView = findViewById(R.id.view_screen)
                         messageView.text =
                             (getString(
                                 R.string.Result_Search_moji_Message2,
                                 moji,
                                 total,
                                 Kikkyo[total - 1]
                             ))
                         //Result_moji_search(moji)
                     }
                     // OKボタンを押したときの処理
                     dialog.dismiss()
                 }
                 .setNegativeButton("キャンセル") { dialog, _ ->
                     // キャンセルボタンを押したときの処理
                     dialog.dismiss()
                 }
                 .create()
             dialog.show()

// ダイアログのボタンを取得し、デフォルトの色を「#000000」に設定
             dialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(getColor(R.color.black))
             dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setTextColor(getColor(R.color.black))

// AppCompatEditTextにTextChangedListenerをセット
             editText.addTextChangedListener(object : TextWatcher {
                 override fun beforeTextChanged(
                     s: CharSequence?,
                     start: Int,
                     count: Int,
                     after: Int
                 ) {
                 }

                 override fun onTextChanged(
                     s: CharSequence?,
                     start: Int,
                     before: Int,
                     count: Int
                 ) {
                 }

                 @SuppressLint("NewApi")
                 override fun afterTextChanged(s: Editable?) {
                     // 1~32文字の時だけOKボタンを有効化する
                     if (s.isNullOrEmpty() || s.length > 32) {
                         dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = false
                         dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                             .setTextColor(getColor(R.color.gray))
                     } else {
                         dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = true
                         dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                             .setTextColor(getColor(R.color.black))
                     }
                 }
             })
         }




//EditText

         fun Input_Kanji_Search() {
             // ダイアログ専用のレイアウトを読み込む
             val dialogLayout = LayoutInflater.from(this).inflate(R.layout.dialog2, null)
             val editText = dialogLayout.findViewById<AppCompatEditText>(R.id.editTextDialog)

// ダイアログ作成
             val dialog = AlertDialog.Builder(this)
                 .setTitle(R.string.Input_MojiSearch_Title)
                 .setMessage(R.string.Input_MojiSearch_Message)
                 .setView(dialogLayout)
                 .setPositiveButton(R.string.Ok) { dialog, _ ->
                     var moji = editText.text.toString()
                     Result_moji_search(moji)
                     // OKボタンを押したときの処理
                     dialog.dismiss()
                 }
                 .setNegativeButton("キャンセル") { dialog, _ ->
                     // キャンセルボタンを押したときの処理
                     dialog.dismiss()
                 }
                 .create()
             dialog.show()

// ダイアログのボタンを取得し、デフォルトの色を「#000000」に設定
             dialog.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(getColor(R.color.black))
             dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setTextColor(getColor(R.color.black))

// AppCompatEditTextにTextChangedListenerをセット
             editText.addTextChangedListener(object : TextWatcher {
                 override fun beforeTextChanged(
                     s: CharSequence?,
                     start: Int,
                     count: Int,
                     after: Int
                 ) {
                 }

                 override fun onTextChanged(
                     s: CharSequence?,
                     start: Int,
                     before: Int,
                     count: Int
                 ) {
                 }

                 @SuppressLint("NewApi")
                 override fun afterTextChanged(s: Editable?) {
                     // 1~32文字の時だけOKボタンを有効化する
                     if (s.isNullOrEmpty() || s.length > 32) {
                         dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = false
                         dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                             .setTextColor(getColor(R.color.gray))
                     } else {
                         dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled = true
                         dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                             .setTextColor(getColor(R.color.black))
                     }
                 }
             })
         }

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
    fun ReferenceBookDialog2() {
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
         fun VersionDialog() {
             AlertDialog.Builder(this)
                 .setTitle(R.string.VersionTitle)
                 .setMessage(R.string.VersionSentense)
                 .setPositiveButton(R.string.Ok) { dialog, which -> }
                 .show()
         }

         // //設定　バイブのオンオフ
         fun Setting_Vibration() {

             val strList = arrayOf(
                 getString(R.string.Setting_Vibration_List1),
                 getString(R.string.Setting_Vibration_List2)
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







