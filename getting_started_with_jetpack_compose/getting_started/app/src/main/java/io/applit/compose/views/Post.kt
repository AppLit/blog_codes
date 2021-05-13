package io.applit.compose.views

import androidx.annotation.DrawableRes
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Divider
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import io.applit.compose.R

@Composable
fun Post(
    @DrawableRes avatarResId: Int,
    name: String,
    text: String,
    @DrawableRes drawableRes: Int? = null
) {
    Column(
        modifier = Modifier
            .background(Color.White)
            .padding(Space.ONE.value, Space.HALF.value)
    ) {

        User(avatarResId = avatarResId, username = name)
        Divider(
            thickness = 0.5.dp,
            modifier = Modifier
                .padding(vertical = Space.QUARTER.value)
        )

        drawableRes?.let { res ->
            Image(
                painter = painterResource(id = res),
                contentDescription = null,
                modifier = Modifier
                    .fillMaxWidth()
                    .clip(RoundedCornerShape(5)),
                contentScale = ContentScale.FillWidth
            )
        }

        Text(
            text = text,
            modifier = Modifier.padding(vertical = Space.HALF.value)
        )
    }
}

@Preview
@Composable
fun PreviewPost() {
    Post(
        avatarResId = R.drawable.ic_avatar,
        name = "AppLit",
        text = "Reach out to us at www.applit.io",
        drawableRes = R.drawable.toronto_skyline
    )
}