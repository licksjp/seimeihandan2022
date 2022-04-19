package com.seimeihandan
import android.app.AlertDialog
import android.app.Dialog
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.os.Bundle
import android.text.Editable
import android.view.Window
import android.view.WindowManager
import android.widget.Button
import android.widget.EditText
import androidx.fragment.app.DialogFragment


class customdialog : DialogFragment() {

    var n = 0
    var moji = "データーがありません"
    var editText = dialog?.findViewById<EditText>(R.id.modal_text)
    var   mojiText = editText?.text.toString()
    override fun onCreateDialog(savedInstanceState: Bundle?): Dialog {

        val dialog: Dialog = Dialog(requireContext())
        val dw = dialog.window
        dw?.let {
            it.requestFeature(Window.FEATURE_NO_TITLE)
            it.setFlags(
                WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
            )
            it.setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT));
        }

        dialog.setContentView(R.layout.dialog)

       // mojiText = null
        //val editText = dialog.findViewById<EditText>(R.id.modal_text)
       //dialog.findViewById<EditText>(R.id.modal_text)
        dialog.findViewById<Button>(R.id.button).setOnClickListener {

            Result_moji_search()

           // editText?.text?.let { it1 ->  }
           // SearchMoji(editText.text.toString())
            //editText?.text?.let { it1 -> Result_moji_search(it1) }
            dialog.dismiss()
        }
        return dialog
    }



    fun SearchMoji(moji:String){

    }
    //漢字検索　結果表示
   private fun Result_moji_search() {

        val res = requireContext().resources
        val Search_1kaku =  res.getStringArray(R.array.Kaku1)
        //val Search_1kaku =  resources.getStringArray(R.array.Kaku1)

       for (i in 0..Search_1kaku.size)
          // if (mojiText != null)
          // {
                if (mojiText.equals(Search_1kaku[i])) {
                var n1 = 1
                var moji1 = "1画で登録されています"
                n = n1
                moji = moji1
                    AlertDialog.Builder(context)
                        .setTitle(R.string.Result_Search_moji_Title)
                        .setMessage(getString(R.string.Result_Search_moji_Message,moji,n))
                        .setPositiveButton(R.string.Ok) { dialog, which -> }
                        .show()
               }
        }




    }
//}