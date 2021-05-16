package io.applit.composerecyclerview.view

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.material.Card
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import io.applit.composerecyclerview.R
import io.applit.composerecyclerview.base.Spacing
import io.applit.composerecyclerview.model.Product

@Composable
fun ProductCard(product: Product) {
    Card(elevation = Spacing.EXTRA_TIGHT.size) {
        Column(
            modifier = Modifier
                .padding(
                    horizontal = Spacing.TIGHT_BASE.size,
                    vertical = Spacing.TIGHT.size
                )
                .width(75.dp)
                .height(75.dp),
        ) {
            Image(
                painter = painterResource(
                    id = product.image
                ),
                contentDescription = product.name,
                modifier = Modifier
                    .fillMaxWidth()
                    .height(30.dp),
                alignment = Alignment.Center,
            )
            Text(
                text = product.name,
                modifier = Modifier
                    .padding(
                        top = Spacing.TIGHT.size
                    )
            )
            Text(
                text = "$ ${"%.2f".format(product.price)}",
                fontSize = 12.sp,
            )
        }
    }
}

@Preview
@Composable
fun PreviewProductCard() {
    ProductCard(product = Product("Product", 20.0, R.drawable.ic_geometric))
}