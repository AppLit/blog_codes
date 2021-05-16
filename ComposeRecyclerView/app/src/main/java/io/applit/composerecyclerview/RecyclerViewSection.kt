package io.applit.composerecyclerview

import io.applit.composerecyclerview.model.PostData
import io.applit.composerecyclerview.model.Product
import androidx.compose.ui.graphics.Color

sealed class RecyclerViewSection
data class Interstitial(val title: String, val description: String, val backgroundColor: Color) :
    RecyclerViewSection()

data class Carousel(val header: String, val products: List<Product>) : RecyclerViewSection()
data class Posts(val posts: List<PostData>) : RecyclerViewSection()
