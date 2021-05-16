package io.applit.composerecyclerview.view

import androidx.compose.foundation.layout.Column
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.sp

enum class HeaderStyle(val fontSize: TextUnit) {
    H1(24.sp),
    H2(20.sp)
}

@Composable
fun Header(text: String, modifier: Modifier = Modifier, style: HeaderStyle = HeaderStyle.H1) {
    Text(
        text = text,
        fontSize = style.fontSize,
        modifier = modifier
    )
}

@Preview
@Composable
fun PreviewHeader() {
    Column {
        Header("Header 1")
        Header(text = "Header 2", style = HeaderStyle.H2)
    }
}