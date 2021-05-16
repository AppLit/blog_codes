package io.applit.composerecyclerview.view

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import io.applit.composerecyclerview.R
import io.applit.composerecyclerview.base.Spacing
import io.applit.composerecyclerview.model.Product

@Composable
fun ProductCarousel(products: List<Product>) {
    LazyRow(
        contentPadding = PaddingValues(
            horizontal = Spacing.BASE.size,
            vertical = Spacing.TIGHT.size,
        ),
        horizontalArrangement = Arrangement.spacedBy(Spacing.BASE.size),
    ) {
        items(products) { product ->
            ProductCard(
                product = product
            )
        }
    }
}

@Preview
@Composable
fun PreviewProductCarousel() {
    ProductCarousel(
        products = listOf(
            Product("Apple", 10.0, R.drawable.ic_geometric),
            Product("Banana", 10.0, R.drawable.ic_bullseye),
            Product("Pineapple", 10.0, R.drawable.ic_winter),
        )
    )
}