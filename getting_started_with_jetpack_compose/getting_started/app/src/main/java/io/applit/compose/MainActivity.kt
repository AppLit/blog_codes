package io.applit.compose

import android.os.Bundle
import androidx.activity.compose.setContent
import androidx.appcompat.app.AppCompatActivity
import androidx.compose.material.MaterialTheme
import io.applit.compose.views.Post

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                Post(
                    avatarResId = R.drawable.ic_avatar,
                    name = "AppLit",
                    text = "Reach out to us at www.applit.io",
                    drawableRes = R.drawable.toronto_skyline
                )
            }
        }
    }
}
