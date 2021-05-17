package io.applit.composerecyclerview.view

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import io.applit.composerecyclerview.base.Spacing

@Composable
fun Banner(
    title: String,
    description: String,
    backgroundColor: Color
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .background(backgroundColor)
            .padding(horizontal = Spacing.BASE.size, vertical = Spacing.BASE.size),
        verticalArrangement = Arrangement.spacedBy(Spacing.TIGHT.size),
    ) {
        Header(text = title)
        Text(text = description)
    }
}

@Preview
@Composable
fun PreviewBanner() {
    Banner("Welcome", "Click this to get started now", backgroundColor = Color.Blue)
}