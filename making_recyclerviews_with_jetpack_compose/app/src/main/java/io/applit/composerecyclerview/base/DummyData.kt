package io.applit.composerecyclerview.base

import androidx.compose.ui.graphics.Color
import io.applit.composerecyclerview.*
import io.applit.composerecyclerview.model.PostData
import io.applit.composerecyclerview.model.Product
import io.applit.composerecyclerview.view.Banner

object DummyData {

    val productImage = listOf(
        R.drawable.ic_bullseye,
        R.drawable.ic_winter,
        R.drawable.ic_geometric,
    )

    val bgColors = listOf(
        Color.LightGray,
        Color.Cyan,
        Color.Yellow,
        Color.Green,
        Color.Red,
    )

    private val usernames = listOf(
        "Bernice Mccabe",
        "Terrence Crawford",
        "Montana Camacho",
        "Halimah Macleod",
        "Madiha Dunkley",
        "Asad Davis",
        "Hunter Farley",
        "Lyndon Odling",
        "Rayhaan Mcmillan",
        "Albert Draper",
    )

    fun getPosts(numPosts: Int): List<PostData> {
        val posts = mutableListOf<PostData>()

        for (i in 1..numPosts) {
            val avatar = productImage[i % productImage.size]
            val username = usernames[i % usernames.size]
            val background = if (i % 3 == 0 || i % 7 == 0) avatar else null

            posts.add(
                PostData(
                    avatar,
                    username,
                    "Lorem ipsum",
                    background
                )
            )
        }

        return posts
    }

    fun getProducts(numProducts: Int): List<Product> {
        val products = mutableListOf<Product>()
        for (i in 1..numProducts) {
            products.add(
                Product(
                    "Item $i",
                    10.0,
                    productImage[i % productImage.size],
                )
            )
        }
        return products
    }

    fun getSections(): List<RecyclerViewSection> = listOf(
        Interstitial(
            title = "Welcome back to AppLit!",
            description = "Here's some new posts",
            backgroundColor = Color.White,
        ),
        Posts(getPosts(1)),
        Carousel("Recommended Products", getProducts(10)),
        Posts(getPosts(10)),
        Carousel("Some More Products", getProducts(15)),
        Posts(getPosts(2)),
    )

}

