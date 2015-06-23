/**
 * Copyright (c) 2015 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.afrolkin.emailwidget;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.widget.RemoteViews;

public class WidgetProvider extends AppWidgetProvider {
    @Override
    public void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] appWidgetIds) {
        super.onUpdate(context, appWidgetManager, appWidgetIds);
        for (int i : appWidgetIds) {
            startBrowsing(context, appWidgetManager, i);
        }
    }

    private void startBrowsing(Context ctx,
                               AppWidgetManager appWidgetManager, int widgetID) {
        RemoteViews widgetView = new RemoteViews(ctx.getPackageName(), R.layout.widget_main);

        // Create URI for the intent
        String uriText = "mailto:" + Uri.encode("email@gmail.com") +
                "?subject=" + Uri.encode("the subject") +
                "&body=" + Uri.encode("the body of the message");
        Intent intent = new Intent(Intent.ACTION_SENDTO).setData(Uri.parse(uriText));
        PendingIntent pIntent = PendingIntent.getActivity(ctx, widgetID, intent, 0);

        // Start the intent when the button is pressed and update the widget manually
        widgetView.setOnClickPendingIntent(R.id.widget_button, pIntent);
        appWidgetManager.updateAppWidget(widgetID, widgetView);
    }
}
