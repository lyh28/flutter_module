package io.flutter.facade;

import android.content.Context;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;

import io.flutter.view.FlutterView;

/**
 * A {@link Fragment} managing a {@link FlutterView}.
 *
 * <p><strong>Warning:</strong> This file is auto-generated by Flutter tooling.
 * DO NOT EDIT.</p>
 */
public class FlutterFragment extends Fragment {
  public static final String ARG_ROUTE = "route";
  private String mRoute = "/";

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    if (getArguments() != null) {
      mRoute = getArguments().getString(ARG_ROUTE);
    }
  }

  @Override

  public void onInflate(Context context, AttributeSet attrs, Bundle savedInstanceState) {
    super.onInflate(context, attrs, savedInstanceState);
  }

  @Override
  public FlutterView onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    return Flutter.createView(getActivity(), getLifecycle(), mRoute);
  }
}
