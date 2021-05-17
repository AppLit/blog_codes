package io.applit.composerecyclerview.model

import androidx.annotation.DrawableRes

data class PostData(
    @DrawableRes val avatar: Int,
    val username: String,
    val description: String,
    @DrawableRes val image: Int? = null
)