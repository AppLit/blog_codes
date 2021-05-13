package io.applit.compose.views

import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp

enum class Space(val value: Dp) {
    TWO(32.dp),
    ONE_AND_HALF(24.dp),
    ONE(16.dp),
    HALF(8.dp),
    QUARTER(4.dp)
}