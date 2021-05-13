package io.applit.compose.views

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
import io.applit.compose.R

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
            modifier = Modifier.padding(horizontal = Space.HALF.value)
        )
    }
}

@Preview
@Composable
fun PreviewUser() {
    User(R.drawable.ic_avatar, "AppLit")
}