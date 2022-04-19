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
                9 -> {
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
                10 -> {
                    /*設定　トップ画面*/
                    mode = 5
                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.Setting_Select1, No))


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
                10->{
                    flag=13
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
                    mode = 99

                    val messageView: TextView = findViewById(R.id.view_screen)
                    messageView.text = (getString(R.string.SeimeiHandan_NoSelect, No))
                    //  Input_moji()
                    //alertDialogDemo()
                }
                9 -> {
                    // Input_moji()
                }
                12 -> {
                    Input_Kanji_Search()
                    // Input_moji()
                }
                13->{
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
    fun Entry_Moji_check()
    {
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
        EntryMoji=Search_1kaku.size+Search_2kaku.size+Search_3kaku.size+Search_4kaku.size+
                Search_5kaku.size+Search_6kaku.size+Search_7kaku.size+Search_8kaku.size+
                Search_9kaku.size+Search_10kaku.size+Search_11kaku.size
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

     fun Result_moji_search(mojiText: String) {
         var n = 0
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
         //10画の文字
         val Search_11kaku = resources.getStringArray(R.array.Kaku11)
         //setContentView(R.layout.dialog2)
         //var editTextDialog  = findViewById(R.id.editTextDialog)
         // val signinView = this.inflate(R.layout.dialog2, null)
         //val builder = AlertDialog.Builder(R.layout.dialog2)
         // var mojiText = editTextDialog.text.toString()

            if ( moji != null) {
                 //1画文字検索
                 for (i in Search_1kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "1画"
                            val messageView: TextView = findViewById(R.id.view_screen)
                              messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                     }
                   }
                 //2画検索
                for (i in Search_2kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "2画"
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //3画検索
                for (i in Search_3kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "3画"
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //4画検索
                for (i in Search_4kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "4画"
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //5画検索
                for (i in Search_5kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "5画"
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //6画検索
                for (i in Search_6kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "6画"
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //7画検索
                for (i in Search_7kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "7画"
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //8画検索
                for (i in Search_8kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "8画"
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //9画検索
                for (i in Search_9kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "9画"
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //10画検索
                for (i in Search_10kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "10画"
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }
                //11画検索
                for (i in Search_11kaku) {
                    if (mojiText == (i)) {
                        var moji1 = "11画"
                        val messageView: TextView = findViewById(R.id.view_screen)
                        messageView.text = (getString(R.string.Result_Search_moji_Message,mojiText,moji1))
                    }
                }


            }

     }
    fun Result_Message(message: String,n : Int)
    {
        AlertDialog.Builder(this)
            .setTitle(R.string.Result_Search_moji_Title)
           // .setMessage(getString(R.string.Result_Search_moji_Message))
            .setMessage(getString(R.string.Result_Search_moji_Message, message, n))
            .setPositiveButton(R.string.Ok) { dialog, which -> }
            .show()

    }
         // 漢字検索
         fun Kanji_Search() {
             //Kanji_Search()
         }

         //
//
//EditText

         @SuppressLint("NewApi")
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







