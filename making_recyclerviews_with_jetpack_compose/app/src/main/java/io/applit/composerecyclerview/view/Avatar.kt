package io.applit.composerecyclerview.view

import androidx.annotation.DrawableRes
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import io.applit.composerecyclerview.R

@Composable
fun Avatar(
    @DrawableRes avatarResId: Int,
    contentDescription: String = "",
    size: Dp = 50.dp
) {
    Image(
        painter = painterResource(avatarResId),
        contentDescription = contentDescription,
        modifier = Modifier
            .clip(shape = RoundedCornerShape(50))
            .size(size)
    )
}

@Preview
@Composable
fun PreviewAvatar() {
    Avatar(avatarResId = R.drawable.ic_bullseye)
}