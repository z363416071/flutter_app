package com.zhanghuan.flutter_app;

import android.os.Bundle;

import androidx.annotation.Nullable;

import com.zhanghuan.plugin.AsrPlugin;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        registerSelfPlugin();
    }

    private void registerSelfPlugin() {
    }
}
