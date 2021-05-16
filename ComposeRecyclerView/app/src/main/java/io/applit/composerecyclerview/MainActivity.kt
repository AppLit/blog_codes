package io.applit.composerecyclerview

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import io.applit.composerecyclerview.base.DummyData
import io.applit.composerecyclerview.base.Spacing
import io.applit.composerecyclerview.ui.theme.ComposeRecyclerViewTheme
import io.applit.composerecyclerview.view.Banner
import io.applit.composerecyclerview.view.Header
import io.applit.composerecyclerview.view.Post
import io.applit.composerecyclerview.view.ProductCarousel

class MainActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContent {
            ComposeRecyclerViewTheme {
                Surface(color = MaterialTheme.colors.background) {
                    LazyColumn(verticalArrangement = Arrangement.spacedBy(Spacing.TIGHT.size)) {
                        DummyData.getSections().forEach { section ->
                            when (section) {
                                is Interstitial -> {
                                    item {
                                        Banner(
                                            title = "Welcome back to AppLit!",
                                            description = "Here's some new posts",
                                            backgroundColor = Color.White,
                                        )
                                    }
                                }
                                is Posts -> {
                                    items(section.posts) { post ->
                                        Post(
                                            post.avatar,
                                            post.username,
                                            post.description,
                                            post.image
                                        )
                                    }
                                }
                                is Carousel -> {
                                    item {
                                        Header(
                                            text = section.header,
                                            modifier = Modifier.padding(
                                                horizontal = Spacing.BASE.size
                                            )
                                        )
                                        ProductCarousel(
                                            products = section.products
                                        )
                                    }
                                }
                            }

                        }
                    }
                }
            }
        }
    }
}
