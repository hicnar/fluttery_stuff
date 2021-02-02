package com.example.fluttery_stuff

import io.flutter.embedding.android.FlutterActivity
import android.view.KeyEvent

class MainActivity: FlutterActivity() {

    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        super.onKeyDown(keyCode, event)
        return true
    }

    override fun onKeyUp(keyCode: Int, event: KeyEvent?): Boolean {
        super.onKeyUp(keyCode, event)
        return true
    }
}