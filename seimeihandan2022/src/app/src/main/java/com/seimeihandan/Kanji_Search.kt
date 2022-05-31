package com.seimeihandan
import android.app.Dialog
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.os.Bundle
import android.view.Window
import android.view.WindowManager
import android.widget.Button
import android.widget.EditText
import androidx.fragment.app.DialogFragment

class Kanji_Search : DialogFragment() {

    override fun onCreateDialog(savedInstanceState: Bundle?): Dialog {

        val dialog2: Dialog = Dialog(requireContext())
        val dw = dialog2.window
        dw?.let {
            it.requestFeature(Window.FEATURE_NO_TITLE)
            it.setFlags(
                WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
            )
            it.setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT));
        }

        dialog2.setContentView(R.layout.kanji_search)
        dialog2.findViewById<EditText>(R.id.search_text).setOnClickListener {

        }
        dialog2.findViewById<Button>(R.id.button).setOnClickListener {
            dialog2.dismiss()
        }
        return dialog2
    }
}