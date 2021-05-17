package io.applit.composerecyclerview.model

import androidx.annotation.DrawableRes

data class Product(val name: String, val price: Double, @DrawableRes val image: Int)
