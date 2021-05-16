package io.applit.composerecyclerview.view

import android.widget.Space
import androidx.annotation.DrawableRes
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.constraintlayout.motion.utils.HyperSpline.Cubic.HALF
import io.applit.composerecyclerview.R
import io.applit.composerecyclerview.base.Spacing

@Composable
fun User(
    @DrawableRes avatarResId: Int,
    username: String
) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Avatar(
            avatarResId = avatarResId,
            size = 40.dp
        )
        Text(
            text = username,
            fontSize = 16.sp,
            modifier = Modifier.padding(horizontal = Spacing.TIGHT.size)
        )
    }
}

@Preview
@Composable
fun PreviewUser() {
    User(R.drawable.ic_bullseye, "AppLit")
}