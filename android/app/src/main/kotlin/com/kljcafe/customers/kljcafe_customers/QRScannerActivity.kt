package com.kljcafe.customers.kljcafe_customers

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.journeyapps.barcodescanner.DecoratedBarcodeView
import com.kljcafe.customers.kljcafe_customers.databinding.ActivityQrScannerBinding

class QRScannerActivity : AppCompatActivity() {

    private lateinit var binding: ActivityQrScannerBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityQrScannerBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.barcodeScanner.decodeSingle { result ->
            val intent = Intent()
            intent.putExtra("qr_result", result.text)
            setResult(Activity.RESULT_OK, intent)
            finish()
        }
    }

    override fun onResume() {
        super.onResume()
        binding.barcodeScanner.resume()
    }

    override fun onPause() {
        super.onPause()
        binding.barcodeScanner.pause()
    }
}
